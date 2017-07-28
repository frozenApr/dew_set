class HomeController < ApplicationController
  def index
    @photos = Photo.all.includes(:user).recently.limit(5)
    @posts = Post.all.includes(:comments).recently.limit(5)
    @comment = Comment.new
  end
end
