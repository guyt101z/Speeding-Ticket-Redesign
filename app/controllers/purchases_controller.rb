class PurchasesController < ApplicationController

	before_filter :authorize, only: [:new, :create, :show, :edit, :update, :index]

#New Action
	def new
		@purchase = Purchase.new
	end
	
#Create Action	
	def create
		@purchase = Purchase.new(purchase_params)
		if @purchase.save
			redirect_to @purchase
		else
			render "new"
		end
	end

#Show Action	
	def show
    	@purchase = Purchase.find(params[:id])
	end

#Edit Action	
	def edit
    	@purchase = Purchase.find(params[:id])
	end

#Update Action	
	def update
		@purchase = Purchase.find(params[:id])
		if @purchase.update_attributes(purchase_params)
			redirect_to @purchase
		else
			render "edit"
		end
	end
	
#Index Action
	def index
		@purchase_list = Purchase.all
	end
	
#Private Actions	
private	
	def purchase_params
		params.require(:purchase).permit(:asset_id, :software_id, :user_id, :item_name, :part_number, :account_number, :grant_account, :quantity, :status, :invoice)
    end

end
