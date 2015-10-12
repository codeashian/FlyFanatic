require 'twitter'

class FavoritesController < ApplicationController


	def index
		@favorites = Favorite.where(:user_id => current_user.id)
		@favs = current_user.favorites


	end

	def show

    twitter = twitter_api

		# get favorite artist from user by url parameters 
		@artist = RSpotify::Artist.search(params[:id]).first
		# get favorite
 		@favorite = current_user.favorites.where(:spotify_id => @artist.id).first

    if @favorite.instagram_id != ""
      @instagram_id     = Instagram.user_search(@favorite.instagram_id).first.id
      @instagram_images = Instagram.user_recent_media(@instagram_id).take(9)
    end

    if @favorite.twitter_user != ""
      @tweets = twitter.user_timeline(@favorite.twitter_user).take(6)
    end

	end

  def create 
     begin RSpotify::Artist.search(params[:id]) 

        artist = RSpotify::Artist.search(params[:id]).first

        f = Favorite.new
        f.spotify_id = artist.id
        f.user_id = current_user.id
        f.name = artist.name       
        
        #save artist-favorite
        if f.save
          flash[:notice] = "Added new favorite"
        else
          flash[:notice] = "Could not add"
        end

        redirect_to(:action => 'show', :controller => 'artist', :id => params[:id])

        rescue 
        flash[:notice] = "nope it didnt work to save "
        redirect_to(:action => 'index')
        end
  end


   def update
   		@favorite = Favorite.find(params[:id])

   		if @favorite.update_attributes(favorites_params)
        	redirect_to(:action => 'show', :id => params[:name])
        else
        	redirect_to(:action => 'show', :id => params[:name])
        end       
   end

   def destroy 
   	@favorite = Favorite.find(params[:id])
   	@favorite.destroy

   	redirect_to favorites_path
   end

   private

   	# attributes which can be modified
   	def favorites_params
      params.require(:favorite).permit(:instagram_id, :twitter_user)
   	end

    def twitter_api 
      twitter = Twitter::REST::Client.new do |config|
        config.consumer_key = 'qKMBT3edaSSIvdFB64CVhCNFB'
        config.consumer_secret = 'bJPTPgHICyHwFzN981vJCQ0ZxdcqL1H2UbE6a3mHxEzdUDIJAd'
        config.access_token = '34411795-neZcSP78maLqBfJWCT9vVFifFKdlTuZ2QRpWsjVG8'
        config.access_token_secret = 'AqchWRy9kLCWk0Cm28J4XFlyboT8VB59xGhR3orqqy0Sd' 
      end
      return twitter
    end
   
end
