class FrontBaseController < ApplicationController
	layout 'frontend'
	before_action :authenticate_user!

end