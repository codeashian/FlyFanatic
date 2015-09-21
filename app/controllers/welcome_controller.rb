class WelcomeController < ApplicationController

	def index
		@artist = params[:artist]
		
	end

	def show 
		@artist = params[:artist]
	end
end
