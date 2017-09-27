class ProductsController < ApplicationController
  include ActionView::Helpers::DateHelper
  def index
    @products = Product.all.recently
  end

  def show
    @product = Product.find(params[:id])
    @comment = Comment.new
  end
end
