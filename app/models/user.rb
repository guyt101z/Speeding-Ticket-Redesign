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
	validates :phone_number, :length => { :minimum => 6, :maximum => 12 }, :allow_blank => true

#Attachments	
    has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "32x32>" }, :default_url => "/images/:style/missing.png"
    
#Definitions
	DEPARTMENT = ['ADPR', 'BCS', 'COMM', 'CSD', 'DEAN', 'JRN', 'TISM' ]
    
#Functions
  def full_name
		[first_name, last_name].join(' ')
	end
	
	def self.search(search)
  	if search
   	 User.where('first_name LIKE ? OR last_name LIKE ? OR email LIKE ? OR location LIKE ? OR phone_number LIKE ? OR department LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
	 	else
    	scoped
		end
	end
	
end
