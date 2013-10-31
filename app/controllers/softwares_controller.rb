class SoftwaresController < ApplicationController

before_filter :authorize, only: [:new, :create, :show, :edit, :update, :index]

#New Action
	def new
		@software = Software.new
	end
	
#Create Action	
	def create
		@software = Software.new(software_params)
		if @software.save
			redirect_to @software
		else
			render "new"
		end
	end

#Show Action	
	def show
    	@software = Software.find(params[:id])
	end

#Edit Action	
	def edit
    	@software = Software.find(params[:id])
	end

#Update Action	
	def update
		@software = Software.find(params[:id])
		if @software.update_attributes(software_params)
			redirect_to @software
		else
			render "edit"
		end
	end
	
#Index Action
	def index
		@software_list = Software.all.search(params[:search])
	end
	
#Private Actions	
private	
	def software_params
		params.require(:software).permit(:asset_id, :title, :version_number, :manufacturer, :license_type, :license_number)
    end

end
