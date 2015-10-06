class FavoritesController < ApplicationController


	def index
		@favorites = Favorite.where(:user_id => current_user.id)
		@favs = current_user.favorites
	end

	def show

		# get favorite artist from user by url parameters 
		@artist = RSpotify::Artist.search(params[:id]).first

		# get favorite
 		@favorite = current_user.favorites.where(:spotify_id => @artist.id).first

	end



   def update
   		@favorite = Favorite.find(params[:id])
   		
   		if @favorite.update_attributes(favorites_params)
        	redirect_to(:action => 'index')
        else
        	redirect_to(:action => 'index')
        end       
   end

   private

   	# attributes which can be modified
   	def favorites_params
   		params.require(:favorite).permit(:instagram_id)
   	end
   
end
