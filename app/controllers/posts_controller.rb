class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  def new
    @post = Post.new
    @uptoken = Image.new.uptoken
    @domain = Image.new.domain
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      params[:post][:images][:url].each { |url| @post.images.create(url: url) }
      redirect_to user_posts_path
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

  private

  def post_params
    params.require(:post).permit(:title, :place, :time, :city, :price, :theme, :content, :outcome, :post_type, :has_clothing, :has_modelling)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end
end
