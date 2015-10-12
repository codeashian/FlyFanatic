require 'RSpotify'

class ArtistController < ApplicationController
  
  before_action :check_if_is_favorite

  def index

  end

  def show
    
    if !params[:id].empty?
      artist = params[:id].tr('åäö','aao')
      @artist    = RSpotify::Artist.search(artist).first
    end
      #@instagram = Instagram.user_recent_media(, {:count => 1})
    
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
