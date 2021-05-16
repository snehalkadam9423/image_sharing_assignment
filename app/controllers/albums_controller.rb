class AlbumsController < ApplicationController
  before_action :authenticate_user!, except: [:show_album]
  def new
    @album = Album.new
    1.times { @album.photos.build }
  end

  def create
    @album = current_user.albums.build(album_params)
    if @album.save
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

  def show_album
    @album = Album.find_by_id(params[:id])
    @photos = @album.photos
  end

  private

  def album_params
    params.require(:album).permit(:name, photos_attributes: [:id, :tagline, :image, :_destroy])
  end

  # def photo_params
  #   params.require(:album).permit(photos_attributes: [:id, :tagline, :image, :_destroy])
  # end
end
