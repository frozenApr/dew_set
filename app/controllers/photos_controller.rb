class PhotosController < ApplicationController
  include ActionView::Helpers::DateHelper

  def show
    @photo = Photo.find(params[:id])
    @images = @photo.images
    respond_to do |format|
      format.html
      format.json { render json: @images.pluck(:url) }
    end
  end
end
