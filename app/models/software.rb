class Software < ActiveRecord::Base

#Asssociations
	has_many :purchases
	has_many :installations
	has_many :assets, :through => :installations

#Validation
	validates_presence_of :title, :version_number, :manufacturer

#Functions
  def full_title
		[title, version_number].join(' ')
	end

end
