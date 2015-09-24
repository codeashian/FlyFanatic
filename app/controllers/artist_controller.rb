require 'RSpotify'

class ArtistController < ApplicationController
  def index

  end

  def show

  	@artist = RSpotify::Artist.find(params[:id])

  end

  def add_favorite 

  	favorite = Favorite.new(:name => params)
  	favorite.name = params[:id]
  	favorite.artist = params[:id]
  	favorite.user_id = current_user.id
  	favorite.save

  	redirect_to(:action => 'index')
  	#fav.name = RSpotify::Artist.find(params[:id])

  end 
end
