class User < ActiveRecord::Base

#Associations
	has_many :assets, :tickets

#Validation
	validates_presence_of :first_name, :last_name, :email, :location, :department
	validates_uniqueness_of :email
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create 
	validates :phone_number, :presence => true,
                      :numericality => true,
                      :length => { :minimum => 7, :maximum => 11 }

#Attachments	
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    
#Functions
    def full_name
		[first_name, last_name].join(' ')
	end
	
end
