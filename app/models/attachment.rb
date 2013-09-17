class Attachment < ActiveRecord::Base

#Associations
	belongs_to :asset
	belongs_to :ticket

end
