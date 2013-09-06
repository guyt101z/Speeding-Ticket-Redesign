class ApplicationController < ActionController::Base

    protect_from_forgery with: :null_session
  
  
#Private Methods
	def current_technician
		@current_technician ||= Technician.find(session[:technician_id]) if session[:technician_id]
	end
	
	helper_method :current_technician
	
	def authorize
		redirect_to login_url, alert: "Not authorized" if current_technician.nil?
	end
	 
end
