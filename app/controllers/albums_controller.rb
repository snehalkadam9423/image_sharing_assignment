class AlbumsController < ApplicationController
	before_action :authenticate_user!
	def new
		@album = Album.new
	end

	def create
		if current_user.albums.create(album_params)
			redirect_to albums_path
		else
			render :new
		end
	end

	def index
		@albums = current_user.albums
	end

	def edit
		@album = Album.find_by_id(params[:id])
	end

	def update
		@album = Album.find_by_id(params[:id])
		if @album.update(album_params)
			redirect_to albums_path
		else
			render :edit
		end
	end

	def show
		@album = Album.find_by_id(params[:id])
	end

	def destroy
		@album = Album.find_by_id(params[:id])
		@album.destroy
		redirect_to albums_path
	end

	private
	def album_params
		params.require(:album).permit(:name)
	end
end
