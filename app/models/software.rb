class Software < ActiveRecord::Base

#Asssociations
	has_many :orders
	has_many :installations
	has_many :assets, :through => :installations

#Validation
	validates_presence_of :title, :version_number, :manufacturer

end
