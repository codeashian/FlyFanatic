class Favorite < ActiveRecord::Base
	belongs_to :user
	#validate :is_instagram

	validates_uniqueness_of :spotify_id

	validate :is_instagram, :on => :update
	
	attr_accessible = :spotify_id, :instagram_id, :twitter_user 

	def is_instagram 
	  	if !Instagram::user_search(self.instagram_id).first
	  		errors.add(:instagram_id, 'not a valid Instagram user')
	  	end
	  end

	def self.search(query)
    where("name like ?", "%#{query}%")
  	end


end
