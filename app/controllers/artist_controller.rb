require 'RSpotify'

class ArtistController < ApplicationController
  
  before_action :check_if_is_favorite

  def index

  end

  def show
    
      @artist    = RSpotify::Artist.search(params[:id]).first
      #@instagram = Instagram.user_recent_media(, {:count => 1})


    

  end

  def add_favorite 

      # if there is existing artist
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

   def check_if_is_favorite

      if user_signed_in?
        found = current_user.favorites.find_by name: params[:id]
        
        if found != nil
          redirect_to(:action => 'show', :controller => 'favorites', :id => params[:id])
        end
      end

   end

   
  

end
