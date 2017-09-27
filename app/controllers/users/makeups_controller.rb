module Users
  class MakeupsController < ApplicationController
    before_action :set_makeup, only: %i[show edit update destroy]
    def new
      @makeup = Makeup.new
      @uptoken = Image.new.uptoken
      @domain = Image.new.domain
    end

    def create
      @makeup = current_user.makeups.new(makeup_params)
      if @makeup.save
        params[:makeup][:images][:url].each { |url| @makeup.images.create(url: url) }
        redirect_to users_makeups_path
      else
        render 'new'
      end
    end

    def index
      @makeups = current_user.makeups.recently
    end

    def destroy
      @makeup.destroy
      redirect_to users_makeups_path, notice: '删除成功！'
    end

    def show
      @images = @makeup.images
      respond_to do |format|
        format.html
        format.json { render json: @images.pluck(:url) }
      end
    end

    private

    def makeup_params
      params.require(:makeup).permit(:title, :brief_intro, :city, :price)
    end

    def set_makeup
      @makeup = current_user.makeups.find(params[:id])
    end
  end
end
