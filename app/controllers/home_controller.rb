class HomeController < ApplicationController
  def index
    @photos = Photo.all.recently.limit(5)
    @posts = Post.all.recently.limit(5)
  end
end
