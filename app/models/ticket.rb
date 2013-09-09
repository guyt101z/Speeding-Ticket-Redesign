class Ticket < ActiveRecord::Base

#Asssociations
	belongs_to :user, :asset
	has_and_belongs_to_many :technicians

#Validation
	validates_presence_of :user_id, :description

end
