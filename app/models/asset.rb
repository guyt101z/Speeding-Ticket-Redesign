class Asset < ActiveRecord::Base

#Asssociations
	belongs_to :user
	has_many :tickets

#Validation
	validates_presence_of :tag_number, :asset_type, :asset_name, :model, :serial_number, :manufacturer
	validates_uniqueness_of :tag_number, :serial_number, :mac_address1, :mac_address2, :mac_address3 
	
end
