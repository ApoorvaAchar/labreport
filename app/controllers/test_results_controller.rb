class TestResultsController < FrontBaseController
  before_action :set_test_result, only: %i[ show edit update destroy  generate_pdf print_pdf]

  # GET /test_results or /test_results.json
  def index
    @test_results = TestResult.order('id desc').paginate(per_page: 10, page: params[:page])
  end

  # GET /test_results/1 or /test_results/1.json
  def show
  end

  # GET /test_results/new
  def new
    @ddd
  end

  # GET /test_results/1/edit
  def edit
  end

  # POST /test_results or /test_results.json
  def create
    @test_result = TestResult.new(test_result_params)

    respond_to do |format|
      if @test_result.save
        format.html { redirect_to @test_result, notice: "Test result was successfully created." }
        format.json { render :show, status: :created, location: @test_result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_results/1 or /test_results/1.json
  def update
    respond_to do |format|
      if @test_result.update(test_result_params)
        format.html { redirect_to @test_result, notice: "Test result was successfully updated." }
        format.json { render :show, status: :ok, location: @test_result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_results/1 or /test_results/1.json
  def destroy
    @test_result.destroy!

    respond_to do |format|
      format.html { redirect_to test_results_path, status: :see_other, notice: "Test result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def print_pdf
    send_data(@test_result.pdf.path, filename: "#{@test_result.uuid}_report.pdf", type: 'application/pdf', disposition: 'inline')
  end

  def generate_pdf
    pdf = WickedPdf.new.pdf_from_string(
      render_to_string('test_results/generate_pdf', layout: 'pdf', :object => @test_result),
      { 
        page_size: 'A4', margin: { top: 35, bottom: 10, left: 0, right: 0 },
        header: { content: render_to_string('test_results/header', layout: 'pdf', locals: { test_result: @test_result }) }
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


    send_data(pdf, filename: "#{@test_result.uuid}_report.pdf", type: 'application/pdf', disposition: 'inline')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_result
      @test_result = TestResult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_result_params
      params.require(:test_result).permit(:patient_name, :result, :pdf, :status)
    end
end
