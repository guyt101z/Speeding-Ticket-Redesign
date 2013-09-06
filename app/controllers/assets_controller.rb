class AssetsController < ApplicationController

	before_filter :authorize, only: [:new, :create, :show, :edit, :update, :index]

#New Action
	def new
		@asset = Asset.new
	end
	
#Create Action	
	def create
		@asset = Asset.new(asset_params)
		if @asset.save
			redirect_to @asset
		else
			render "new"
		end
	end

#Show Action	
	def show
    	@asset = Asset.find(params[:id])
	end

#Edit Action	
	def edit
    	@asset = Asset.find(params[:id])
	end

#Update Action	
	def update
		@asset = Asset.find(params[:id])
		if @asset.update_attributes(asset_params)
			redirect_to @asset
		else
			render "edit"
		end
	end
	
#Index Action
	def index
		@asset_list = Asset.all
	end
	
#Private Actions	
private	
	def asset_params
		params.require(:asset).permit(:user_id, :tag_number, :asset_type, :asset_name, :model, :serial_number, :manufacturer, :mac_address1, :mac_address2, :mac_address3, :description, :notes, :other)
    end
	
end
