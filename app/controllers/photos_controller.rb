class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
  end

private

  def photo_params
     params.require(:photo).permit(:title, :brief_intro, :place, :key_word, :kind)
  end
end
