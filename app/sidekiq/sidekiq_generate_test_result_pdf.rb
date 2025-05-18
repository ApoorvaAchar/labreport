
class SidekiqGenerateTestResultPdf
  include Sidekiq::Job
  include ApplicationHelper
 
  sidekiq_options queue: :critical, lock: :until_executed, lock_info: true, lock_timeout: 0

  def perform(params)

    @test_result = TestResult.find(params["record_id"])
    
    pdf = WickedPdf.new.pdf_from_string(
      ActionController::Base.new.render_to_string('test_results/generate_pdf', layout: 'pdf', locals: { test_result:  @test_result }),
      { 
        page_size: 'A4', margin: { top: 25, bottom: 10, left: 0, right: 0 },
        header: { content: ActionController::Base.new.render_to_string('test_results/header', layout: 'pdf', locals: { test_result:  @test_result }) }
      }
    )


    file_path = Rails.root.join('pdfs', "resource_#{@test_result.id}.pdf")
    File.delete(file_path) if File.exist?(file_path)

    File.open(Rails.root.join('pdfs', "resource_#{@test_result.id}.pdf"), 'wb') do |file|
      file << pdf
    end

    @test_result.pdf = File.open(Rails.root.join('pdfs', "resource_#{@test_result.id}.pdf"))
    @test_result.status = 'processed'
    @test_result.save
  end


end