class CommentsController < ApplicationController

#Filters
	before_filter :load_commentable

#Index Action
	def index
		@comments = @commentable.comments
	end

#New Action
    def new
    	@comment = @commentable.comments.new(comment_params)
    end
    
#Create Action
	def create
		@comment = @commentable.comments.new(comment_params)
		@comment.technician_id = current_technician.id
		if @comment.save
			redirect_to @commentable
		else
			render "new"
		end
	end

#Private Actions
private
	def load_commentable
		resource, id = request.path.split('/')[1, 2]
		@commentable = resource.singularize.classify.constantize.find(id)
	end
	
	def comment_params
		params.require(:comment).permit(:technician_id, :commentable_id, :commentable_type, :content)
  end
    
end
