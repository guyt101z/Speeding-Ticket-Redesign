class Ticket < ActiveRecord::Base

#Asssociations
	belongs_to :user 
	has_many :assignments
	has_many :technicians, :through => :assignments
	has_many :attachments
	has_many :assets, :through => :attachments
	has_many :comments, as: :commentable

#Validation
	validates_presence_of :description

#Definitions
	TICKET_STATUS = ['not started', 'in progress', 'parts hold', 'client wait', 'done']
	
#Methods
	def user_email
  	user.try(:email)
	end

	def user_email=(email)
 	 self.user = User.find_by_email(email) if email.present?
 	end

 	def self.search(search)
  	if search
   	 Ticket.joins(:user).where('title LIKE ? OR description LIKE ? OR users.first_name LIKE ? OR users.last_name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
	 	else
    	scoped
		end
	end

end
