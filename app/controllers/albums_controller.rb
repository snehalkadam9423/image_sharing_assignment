# frozen_string_literal: true

# rubocop:todo Style/Documentation
class AlbumsController < ApplicationController
  before_action :authenticate_user!, except: [:show_album]
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id
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
    params.require(:album).permit(:name)
  end
end
# rubocop:enable Style/Documentation
