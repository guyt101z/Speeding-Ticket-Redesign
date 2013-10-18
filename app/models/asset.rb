class Asset < ActiveRecord::Base

#Asssociations
	belongs_to :user
	has_many :purchases
	has_many :installations
	has_many :softwares, :through => :installations
	has_many :attachments
	has_many :tickets, :through => :attachments
	has_many :comments, as: :commentable
	has_paper_trail :on => [:create, :update],
					:only => [:user_id, :location, :asset_name, :serial_number, :mac_address1, :mac_address2, :mac_address3]

#Validation
	validates_presence_of :location, :tag_number, :asset_type, :asset_name, :model, :serial_number, :manufacturer
	validates_uniqueness_of :tag_number, :serial_number
	validates_uniqueness_of :mac_address1, :allow_blank => true
	
#Definitions
	ASSET_TYPE = ['', 'Apple Laptop', 'Apple Desktop', 'Windows Laptop', 'Windows Desktop', 'iPad', 'Windows Tablet', 'iPod', 'Monitor', 'External HDD', 'Server', 'Linux PC', 'Apple TV', 'Camera', 'Loud Speakers', 'Projector', 'Television', 'Video Equiptment', 'Printer', 'Network Device']
	
	
#Methods
	def user_email
  	user.try(:email)
	end

	def user_email=(email)
 	 self.user = User.find_by_email(email) if email.present?
 	end
 	
 	def self.search(search)
  	if search
   	 Asset.joins(:user).where('assets.location LIKE ? OR tag_number LIKE ? OR asset_type LIKE ? OR asset_name LIKE ? OR model LIKE ? OR serial_number LIKE ? OR mac_address1 LIKE ? OR mac_address2 LIKE ? OR mac_address3 LIKE ? OR users.first_name LIKE ? OR users.last_name LIKE ? OR users.email LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
	 	else
    	scoped
		end
	end
	
end
