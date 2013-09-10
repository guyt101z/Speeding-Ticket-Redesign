class Assignment < ActiveRecord::Base

#Associations
	belongs_to :technician
	belongs_to :ticket

end
