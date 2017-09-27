module Users
  class ProductsController < ApplicationController
    before_action :set_product, only: %i[show edit update destroy]
    def new
      @product = Product.new
      @uptoken = Image.new.uptoken
      @domain = Image.new.domain
    end

    def create
      @product = current_user.products.new(product_params)
      if @product.save
        params[:product][:images][:url].each { |url| @product.images.create(url: url) }
        redirect_to users_products_path
      else
        render 'new'
      end
    end

    def index
      @products = current_user.products.recently
    end

    def destroy
      @product.destroy
      redirect_to users_products_path, notice: '删除成功！'
    end

    def show
      @images = @product.images
      respond_to do |format|
        format.html
        format.json { render json: @images.pluck(:url) }
      end
    end

    private

    def product_params
      params.require(:product).permit(:title, :brief_intro, :city, :kind, :price, :ori_price, :free_shipping, :use_state)
    end

    def set_product
      @product = current_user.products.find(params[:id])
    end
  end
end
