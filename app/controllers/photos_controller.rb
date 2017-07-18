class PhotosController < ApplicationController
  before_action :set_photo, only: %i[show edit update destroy]
  def new
    @photo = Photo.new
    @uptoken = Image.new.uptoken
    @domain = Image.new.domain
  end

  def create
    @photo = current_user.photos.new(photo_params)
    if @photo.save
      params[:photo][:images][:url].each { |url| @photo.images.create(url: url) }
      redirect_to :root
    else
      render 'new'
    end
  end

  def index
    @photos = current_user.photos.recently
  end

  def show
    @images = @photo.images.recently
    respond_to do |format|
      format.html
      format.json { render json: @images.pluck(:url) }
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :brief_intro, :place, :key_word, :kind)
  end

  def set_photo
    @photo = current_user.photos.find(params[:id])
  end
end
