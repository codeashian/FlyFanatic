require 'RSpotify'

class ProfileController < ApplicationController

	def index
		@user = current_user
		@favorites = Favorite.all
	end

	def favorites
		@favorites = Favorite.where(:user_id => current_user.id)

		@favs = current_user.favorites

		

	end
end
