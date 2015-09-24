class ProfileController < ApplicationController

	def index
		@user = current_user
		@favorites = Favorite.all
	end

	def favorites
		@favorites = Favorite.where(:user_id => current_user.id)

		@artists = []
		@favorites.each do |f|
			@artists = @artists.push(RSpotify::Artist.find(f.artist))
		end

		@artists

		

	end
end
