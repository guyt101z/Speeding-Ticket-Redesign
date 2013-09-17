class Asset < ActiveRecord::Base

#Asssociations
	belongs_to :user
	has_many :purchases
	has_many :installations
	has_many :softwares, :through => :installations
	has_many :attachments
	has_many :tickets, :through => :attachments
	has_many :comments, as: :commentable

#Validation
	validates_presence_of :location, :tag_number, :asset_type, :asset_name, :model, :serial_number, :manufacturer
	validates_uniqueness_of :tag_number, :serial_number
	
end
