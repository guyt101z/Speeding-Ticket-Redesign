class Purchase < ActiveRecord::Base

#Associations
	belongs_to :software
	belongs_to :user
	has_many :purchasings
	has_many :assets, :through => :purchasings
	
#Validation
	validates_presence_of :user_id, :account_number, :quantity

#Definitions
	PURCHASE_STATUS = ['New', 'Open', 'Closed']

#Methods
	def user_email
  	user.try(:email)
	end

	def user_email=(email)
 	 self.user = User.find_by_email(email) if email.present?
 	end
 	
	def self.search(search)
  	if search
    	Purchase.joins(:user).where('item_name LIKE ? OR part_number LIKE ? OR account_number LIKE ? OR users.first_name LIKE ? OR users.last_name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
		else
    	scoped
		end
	end

end
