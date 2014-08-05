class ProductsController < ApplicationController
  skip_before_action :authentication_required, only: :index
  before_action :set_product, only: [:show, :edit]

  def index
    @products = Product.all
  end

  def new
    # @user = User.find(params[:id]) we should have access session[:user_id]
    @product = Product.new
  end

  def create
    if @product = Product.create(product_hash)
      redirect_to(@product)
    else
      render :edit
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_hash)
      redirect_to(@product)
    else
      render :edit
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_hash
      params.require(:product).permit(:title, :price)
    end

end