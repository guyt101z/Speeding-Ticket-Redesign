class Technician < ActiveRecord::Base

#Associations
	has_many :comments
	has_many :assignments
	has_many :tickets, :through => :assignments

#Validation
	validates_presence_of :first_name, :last_name, :email
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
	validates_uniqueness_of :email
	
#Attachements
	has_secure_password
	has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "32x32>" }, :default_url => "/images/:style/missing.png"

#Generate authorization token before creating user
	before_create {generate_token(:auth_token)}

#Functions
    def full_name
		[first_name, last_name].join(' ')
	end
	
	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while Technician.exists?(column => self[column])
	end
	
end
