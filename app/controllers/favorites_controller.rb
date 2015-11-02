require 'twitter'
require 'net/http'
require 'uri'
require 'bandsintown'
require 'bing-search'

class FavoritesController < ApplicationController

  caches_page :index, :show
  
 


	def index 
    expires_in 1.minute, public: true
		@favorites = Favorite.where(:user_id => current_user.id)
		@favs = current_user.favorites


	end

	def show

		# current favorite
 		@favorite = current_user.favorites.where(:name => params[:id]).first

    # if instagram_id exists
    if @favorite.instagram_id != ""
       @instagram_id     = Instagram.user_search(@favorite.instagram_id).first.id
     @instagram_images = Instagram.user_recent_media(@instagram_id).take(9)
    end

    @insta_users = []
    @instagram_users = Instagram.user_search(params[:id]).take(5)

    # check if not private
    if @favorite.news == true 
       BingSearch.account_key = '+UAV1IbOg4zDavRN+30Gey9a5EeipB91+BW3rR/3PeM'
       @news_search = BingSearch.news(params[:id]).take(4)
    end


    twitter = twitter_api
    if @favorite.twitter_user != ""

      @tweets_result = twitter.user_timeline(@favorite.twitter_user).take(3)

    end

    # get events from bandsintown
    @events = get_events(params[:id]).take(4)

    expires_in 5.minute, public: true

  end

  def make_link(url)
    '<a href="' + url + '">' + url + '</a>'
  end

  def create 
    
     begin RSpotify::Artist.search(params[:id]) 

        artist = RSpotify::Artist.search(params[:id]).first

        f            = Favorite.new
        f.spotify_id = artist.id
        f.user_id    = current_user.id
        f.name       = artist.name
        f.image      = artist.images.first['url']
        
        #save artist-favorite
        if f.save
          flash[:notice] = "Added new favorite"
        else
          flash[:notice] = "Could not add"
        end

        redirect_to(:action => 'edit', :controller => 'favorites', :id => params[:id])

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

   def edit 

    @favorite = current_user.favorites.where(:name => params[:id]).first

    @insta_users = []

    @instagram_users = Instagram.user_search(params[:id]).take(5)

    @instagram_users.each do |i| 
      begin Instagram.user_recent_media(i.id)
        @insta_users.push(i)
      rescue
        puts "hej"
      end 
    end

    twitter = twitter_api

    @tweets_search = twitter.user_search(params[:id].tr('åäö','aao')).take(4)

   end

   def destroy 
   	@favorite = Favorite.find(params[:id])
   	@favorite.destroy

   	redirect_to favorites_path
   end

   private

   	# attributes which can be modified
   	def favorites_params
      params.require(:favorite).permit(:instagram_id, :twitter_user, :news)
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
   
    def get_events(artist)
        
        artist = Bandsintown::Artist.new({
          :name => artist
        })
        # create API-name
        artist = artist.api_name 

        # get artist url and parse to object-data
        cont = Net::HTTP.get(URI.parse("http://api.bandsintown.com/artists/" + artist + "/events.json?api_version=2.0&app_id=flyfanatic"))
        content = JSON.parse(cont)

        if !content.include?("errors")
          return content
        else 
          return []
        end

    end

end
