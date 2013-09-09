class SessionsController < ApplicationController

	skip_before_filter :authorize

#New Action
  	def new
  	end
  
#Create Action
    def create
		technician = Technician.find_by_email(params[:email]) 
		if technician && technician.authenticate(params[:password])
			if params[:remember_me]
				cookies.permanent[:auth_token] = technician.auth_token
			else
				cookies[:auth_token] = technician.auth_token
			end
			cookies.permanent[:auth_token] = technician.auth_token
			redirect_to root_url, notice: "Logged In"
		else
			flash[:alert] = "Email or password is invalid"
			render "new"
		end
	end

#Destroy Action
	def destroy
		cookies.delete(:auth_token) 
		redirect_to root_url, notice: "Logged Out"
	end
	
end
