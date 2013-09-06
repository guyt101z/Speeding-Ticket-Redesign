class TechniciansController < ApplicationController

	before_filter :authorize, except: [:new, :create]

#New Action
	def new
		@technician = Technician.new
	end

#Create Action	
	def create
		@technician = Technician.new(technician_params)
		if @technician.save
			session[:technician_id] = @technician.id
			redirect_to root_url, notice: "Your account has been created"
		else
			render "new"
		end
	end

#Show Action	
	def show
    	@technician = Technician.find(params[:id])
	end

#Edit Action	
	def edit
    	@technician = Technician.find(params[:id])
	end

#Update Action	
	def update
		@technician = Technician.find(params[:id])
		if @technician.update_attributes(technician_params)
			redirect_to @technician
		else
			render "edit"
		end
	end

#Index Action	
	def index
		@technician_list = Technician.all
	end
	
#Private Actions	
private	
	def technician_params
		params.require(:technician).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
    end
	
end
