class Comment < ActiveRecord::Base

#Asssociations
	belongs_to :tickets
	belongs_to :technicians

end
