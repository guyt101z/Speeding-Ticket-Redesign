class Installation < ActiveRecord::Base

	belongs_to :asset
	belongs_to :software

end
