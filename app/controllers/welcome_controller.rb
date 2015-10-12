require 'Rspotify'

class WelcomeController < ApplicationController

	respond_to :html, :xml, :json
	def index
		
		if params[:artist] != nil
			if !params[:artist].empty?
				artist = params[:artist].tr('åäö','aao')	#@artists = RSpotify::Artist.search(params[:artist_name]).first
				@artist = RSpotify::Artist.search(artist).take(5)
			end
		end
		
	end

	def show 

		if params[:artist] != nil
		@artist = RSpotify::Artist.search(params[:artist]).take(5)
		respond_to do |format|
		    format.html # show_rec_horses.html.erb
		    format.js   # show_rec_horses.js.erb
		  end
		 end
	end

end
