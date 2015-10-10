class FavoritesController < ApplicationController


	def index
		@favorites = Favorite.where(:user_id => current_user.id)
		@favs = current_user.favorites

		  respond_to do |format|
		    format.html
		    format.json
		  end

	end

	def show

		# get favorite artist from user by url parameters 
		@artist = RSpotify::Artist.search(params[:id]).first
		# get favorite
 		@favorite = current_user.favorites.where(:spotify_id => @artist.id).first

    if @favorite.instagram_id != "0"
      @instagram_id     = Instagram.user_search(@favorite.instagram_id).first.id
      @instagram_images = Instagram.user_recent_media(@instagram_id).take(9)
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
        	redirect_to(:action => 'index')
        else
        	redirect_to(:action => 'index')
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
   		params.require(:favorite).permit(:instagram_id)
   	end
   
end
