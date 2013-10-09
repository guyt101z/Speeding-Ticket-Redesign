class UsersController < ApplicationController

	before_filter :authorize, only: [:new, :create, :show, :edit, :update, :index]

#New Action
	def new
		@user = User.new
	end

#Create Action	
	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user
		else
			render "new"
		end
	end

#Show Action	
	def show
    	@user = User.find(params[:id])
    	@commentable = @user
    	@comments = @commentable.comments
    	@comment = Comment.new
	end

#Edit Action	
	def edit
    	@user = User.find(params[:id])
	end

#Update Action	
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to @user
		else
			render "edit"
		end
	end

#Index Action	
	def index
		@user_list = User.all.search(params[:search])
	end
	
#Private Actions	
private	
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :location, :phone_number, :department, :avatar)
    end
	
end
