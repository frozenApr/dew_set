class PostsController < ApplicationController
  def index
    @posts = current_user.posts.recently
  end

  def show
    @post = current_user.posts.find(params[:id])
    @images = @post.images
    respond_to do |format|
      format.html
      format.json { render json: @images.pluck(:url) }
    end
  end
end
