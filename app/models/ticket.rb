class Ticket < ActiveRecord::Base

#Asssociations
	belongs_to :user 
	belongs_to :asset
	has_many :comments
	has_many :assignments
	has_many :technicians, :through => :assignments

#Validation
	validates_presence_of :user_id, :description

end
