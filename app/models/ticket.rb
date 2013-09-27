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

end
