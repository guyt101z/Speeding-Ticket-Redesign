class User < ActiveRecord::Base

#Associations
	has_many :assets 
	has_many :tickets
	has_many :purchases
	has_many :comments, as: :commentable

#Validation
	validates_presence_of :first_name, :last_name, :email, :location, :department
	validates_uniqueness_of :email
	validates :email, :email => true
	validates :phone_number, :length => { :minimum => 6, :maximum => 12 }

#Attachments	
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    
#Functions
    def full_name
		[first_name, last_name].join(' ')
	end
	
end
