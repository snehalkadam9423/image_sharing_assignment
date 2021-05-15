# frozen_string_literal: true

# rubocop:todo Style/Documentation
class PhotosController < ApplicationController
  before_action :authenticate_user!
  def new
    @album = Album.find_by_id(params[:album_id])
    @photo = @album.photos.build
  end

  def create
    @album = Album.find_by_id(params[:album_id])
    @photo = Photo.new(photo_params)
    @photo.album_id = @album.id
    if @photo.save
      redirect_to album_photos_path
    else
      render :new
    end
  end

  def index
    @album = Album.find_by_id(params[:album_id])
  end

  def edit
    @album = Album.find_by_id(params[:album_id])
    @photo = Photo.find_by_id(params[:id])
  end

  def update
    @photo = Photo.find_by_id(params[:id])
    if @photo.update(photo_params)
      redirect_to album_photos_path
    else
      render :edit
    end
  end

  def show
    @photo = Photo.find_by_id(params[:id])
  end

  def destroy
    @photo = Photo.find_by_id(params[:id])
    @photo.destroy
    redirect_to album_photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:tagline, :image)
  end
end
# rubocop:enable Style/Documentation
