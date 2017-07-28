module Users
  class PostsController < ApplicationController
    before_action :set_post, only: %i[show edit update destroy star]
    def new
      @post = Post.new
      @uptoken = Image.new.uptoken
      @domain = Image.new.domain
    end

    def create
      @post = current_user.posts.new(post_params)
      if @post.save
        params[:post][:images][:url].each { |url| @post.images.create(url: url) }
        redirect_to :root
      else
        render 'new'
      end
    end

    def index
      @posts = current_user.posts.recently
    end

    def show
      @images = @post.images
      respond_to do |format|
        format.html
        format.json { render json: @images.pluck(:url) }
      end
    end

    def destroy
      @post.destroy
      redirect_to users_posts_path
    end

    def star
      current_user.create_action(:star, target: @post)
      redirect_to :back
    end

    private

    def post_params
      params.require(:post).permit(:title, :place, :time, :city, :price, :theme,
                                   :content, :outcome, :post_type, :has_clothing, :has_modelling)
    end

    def set_post
      @post = current_user.posts.find(params[:id])
    end
  end
end
