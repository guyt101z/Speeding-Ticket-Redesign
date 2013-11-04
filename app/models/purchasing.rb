class Purchasing < ActiveRecord::Base
	belongs_to :purchase
	belongs_to :asset
end
