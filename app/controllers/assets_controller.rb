class AssetsController < ApplicationController

	def new
		@asset = Asset.new
	end
	
	def create
		@asset = Asset.new(asset_params)
		if @asset.save
			redirect_to @asset
		else
			render "new"
		end
	end
	
	def show
    	@asset = Asset.find(params[:id])
	end
	
	def edit
    	@asset = Asset.find(params[:id])
	end
	
	def update
		@asset = Asset.find(params[:id])
		if @asset.update_attributes(asset_params)
			redirect_to @asset
		else
			render "edit"
		end
	end
	
	def index
		@asset_list = Asset.all
	end
	
	
private	
	def asset_params
		params.require(:asset).permit(:user_id, :tag_number, :asset_type, :asset_name, :model, :serial_number, :manufacturer, :mac_address1, :mac_address2, :mac_address3, :description, :notes, :other)
    end
	
end
