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
		@new = Purchase.where(:status => 'new').search(params[:search]).order("created_at DESC")
		@open = Purchase.where(:status => 'open').search(params[:search]).order("created_at DESC")
		@closed = Purchase.where(:status => 'closed').search(params[:search]).page(params[:page]).per_page(25).order("created_at DESC")
	end
	
#Private Actions	
private	
	def purchase_params
		params.require(:purchase).permit(:software_id, :user_id, :item_name, :part_number, :account_number,{:asset_ids => []}, :quantity, :status, :invoice, :user_email)
    end

end
