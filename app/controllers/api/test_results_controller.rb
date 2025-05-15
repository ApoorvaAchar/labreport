class Api::TestResultsController < ActionController::API

	before_action :parse_input_body, if: ->{ request.post? }

  def test_result_upload
  	puts @request_body

  	@error = []

  	if @request_body.blank?
  		@error << "Please enter valid JSON input"
  	else
  		if (@request_body["patient"]["name"].blank? rescue true)
  			@error << "Please enter Patient Name"
  		end
  	end

    if @error.blank?
	  	test_result = TestResult.new
	    test_result.status = 'pending'
	    test_result.patient_name = @request_body["patient"]["name"]
	    test_result.result = @request_body
	  	test_result.save
	  	render json: { "body" => {  uuid: test_result.uuid   } }, status: 200
	  else
	  	render json: { "body" => {  message: @error.join(", ") } }, status: 400
	  end
  end


  
  private

	  def parse_input_body
	  	begin
	  		@request_body = JSON.parse(request.body.read)
	  	rescue StandardError => e
	  		render json: ERROR_400, status: 400
	  	end
	  end

end