require 'RSpotify'

class ProfileController < ApplicationController

	def index
		@user = current_user
		@favorites = Favorite.all
	end

	def favorites


		

	end
end
