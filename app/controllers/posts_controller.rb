class PostsController < ApplicationController
  include ActionView::Helpers::DateHelper
  def index
    @posts = Post.all.recently
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
end
