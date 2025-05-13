class FrontBaseController < ApplicationController
	layout 'frontend'
	before_action :authenticate_user!



	def find_lab_test
		@lab_test = LabTest.find(params[:lab_test_id])
	end

end