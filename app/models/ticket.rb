class Ticket < ActiveRecord::Base

#Asssociations
	belongs_to :user 
	has_many :assignments
	has_many :technicians, :through => :assignments
	has_many :attachments
	has_many :assets, :through => :attachments
	has_many :comments, as: :commentable

#Validation
	validates_presence_of :user_id, :description

end
