class Favorite < ActiveRecord::Base
	belongs_to :user

	validates_uniqueness_of :artist

	


end
