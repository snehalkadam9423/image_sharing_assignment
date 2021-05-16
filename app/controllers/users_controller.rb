class UsersController < ApplicationController
	def profile
		@user = User.find_by_id(params[:user_id])
		@albums = @user.albums.joins(:photos).distinct
	end
end
