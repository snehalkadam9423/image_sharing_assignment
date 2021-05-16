class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_album, only: [:index, :edit]
  before_action :set_photo, only: [:update, :edit, :destroy]
  
  def update
    if @photo.update(photo_params)
      redirect_to album_photos_path
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to album_photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:tagline, :image)
  end

  def set_album
    @album = Album.find_by_id(params[:album_id])
  end

  def set_photo
    @photo = Photo.find_by_id(params[:id])
  end
end
