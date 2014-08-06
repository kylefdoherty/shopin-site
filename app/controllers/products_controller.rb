class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit]

  def index
    @products = Product.all
  end

  def show
    @seller = User.find(@product.seller_id)
  end 

  def new
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
      params.require(:product).permit(:title, :price, :description)
    end

end