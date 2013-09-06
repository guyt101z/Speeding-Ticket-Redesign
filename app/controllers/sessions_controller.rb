class SessionsController < ApplicationController

#New Action
  	def new
  	end
  
#Create Action
    def create
		technician = Technician.find_by_email(params[:email]) 
		if technician && technician.authenticate(params[:password])
			session[:technician_id] = technician.id
			redirect_to root_url, notice: "Logged In"
		else
			flash[:notice] = "Email or password is invalid"
			render "new"
		end
	end

#Destroy Action
	def destroy
		session[:technician_id] = nil 
		redirect_to root_url, notice: "Logged Out"
	end
	
end
