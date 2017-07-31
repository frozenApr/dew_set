module Users
  class PhotosController < ApplicationController
    before_action :set_photo, only: %i[show edit update destroy like star]
    def new
      @photo = Photo.new
      @uptoken = Image.new.uptoken
      @domain = Image.new.domain
    end

    def create
      @photo = current_user.photos.new(photo_params)
      if @photo.save
        params[:photo][:images][:url].each { |url| @photo.images.create(url: url) }
        redirect_to users_photos_path
      else
        render 'new'
      end
    end

    def index
      @photos = current_user.photos.recently
    end

    def destroy
      @photo.destroy
      redirect_to users_photos_path, notice: '相册已删除！'
    end

    def show
      @images = @photo.images
      respond_to do |format|
        format.html
        format.json { render json: @images.pluck(:url) }
      end
    end

    def like
      current_user.like_photo?(@photo) ? current_user.unlike_photo(@photo) : current_user.like_photo(@photo)
      redirect_to :root
    end

    def star
      current_user.star_photo?(@photo) ? current_user.unstar_photo(@photo) : current_user.star_photo(@photo)
      redirect_to :root
    end

    private

    def photo_params
      params.require(:photo).permit(:title, :brief_intro, :place, :key_word, :kind)
    end

    def set_photo
      @photo = current_user.photos.find(params[:id])
    end
  end
end
