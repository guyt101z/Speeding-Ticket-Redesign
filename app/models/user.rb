class User < ActiveRecord::Base

	has_many :assets

	validates_presence_of :first_name, :last_name, :email, :location, :department
	
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    
    def full_name
		[first_name, last_name].join(' ')
	end
end
