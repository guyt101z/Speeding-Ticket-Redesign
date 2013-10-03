class TicketsController < ApplicationController

	before_filter :authorize, only: [:new, :create, :show, :edit, :update, :index]

#New Action
	def new
		@ticket = Ticket.new
	end
	
#Create Action	
	def create
		@ticket = Ticket.new(ticket_params)
		if @ticket.save
			redirect_to @ticket
		else
			render "new"
		end
	end

#Show Action	
	def show
    	@ticket = Ticket.find(params[:id])
    	@commentable = @ticket
    	@comments = @commentable.comments
    	@comment = Comment.new
	end

#Edit Action	
	def edit
    	@ticket = Ticket.find(params[:id])
	end

#Update Action	
	def update
		@ticket = Ticket.find(params[:id])
		if @ticket.update_attributes(ticket_params)
			redirect_to @ticket
		else
			render "edit"
		end
	end
	
#Index Action
	def index
		@my_tickets = @current_technician.tickets.where.not(:status => 'done').search(params[:search]).order("created_at DESC")
		@active_tickets = Ticket.where.not(:status => 'done').search(params[:search]).order("created_at DESC")
		@inactive_tickets = Ticket.where(:status => 'done').search(params[:search]).order("created_at DESC").page(params[:page]).per_page(13)
		@new_tickets = @active_tickets.where(:technicians_count => 0)
	end
	
#Private Actions	
private	
	def ticket_params
		params.require(:ticket).permit(:user_id, :asset_id, :title, :description, :status, :deadline, :priority, {:technician_ids => []}, {:asset_ids => []}, :user_email)
    end
	
end
