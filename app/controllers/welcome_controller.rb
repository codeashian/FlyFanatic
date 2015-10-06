require 'Rspotify'

class WelcomeController < ApplicationController


	def index
		
		if params[:artist] != nil
			artist = params[:artist].tr('åäö','aao')	#@artists = RSpotify::Artist.search(params[:artist_name]).first
			@artist = RSpotify::Artist.search(artist).take(5)
		end

	end

	def show 

		@artist = RSpotify::Artist.search(params[:id])

	end

end
