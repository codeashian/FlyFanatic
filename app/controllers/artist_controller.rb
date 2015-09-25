require 'RSpotify'

class ArtistController < ApplicationController
  def index

  end

  def show

  	@artist = RSpotify::Artist.find(params[:id])

  end

  def add_favorite 

      # if there is existing artist
      begin RSpotify::Artist.find(params[:id]) 
        
        f = Favorite.new
        f.name = params[:id]
        f.user_id = current_user.id
        f.artist = params[:id]
        
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
  

end
