class Purchase < ActiveRecord::Base

#Associations
	belongs_to :asset
	belongs_to :software
	belongs_to :user
	
#Validation
	validates_presence_of :user_id, :account_number, :quantity

end
