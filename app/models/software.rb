class Software < ActiveRecord::Base

#Asssociations
	has_many :purchases
	has_many :installations
	has_many :assets, :through => :installations

#Validation
	validates_presence_of :title, :version_number, :manufacturer

#Definitions
	LICENSE_TYPE = ['', 'Single User', 'Volume License', 'Licence Server (Network)', 'Site Licence', 'Perpetual License', 'USB Dongle', 'Open Source']

#Functions
  def full_title
		[title, version_number].join(' ')
	end

end
