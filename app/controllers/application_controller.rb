class ApplicationController < ActionController::Base

    protect_from_forgery with: :null_session
  
  
#Private Methods
	def current_technician
		@current_technician ||= Technician.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
	end
	
	helper_method :current_technician
	
	def authorize
		redirect_to login_url if current_technician.nil?
	end
	
end
