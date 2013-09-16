class Comment < ActiveRecord::Base

#Associations
	belongs_to :commentable, polymorphic: true
	belongs_to :technician

end
