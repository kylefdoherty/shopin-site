class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit]
  before_action :authorize_vendor!, except: [:index, :show]
  skip_before_action :authentication_required, only: [:index, :show]

  def index
    # @search = Product.search do
    #   fulltext params[:search]
    # end
    # @products = @search.results
    @products = Product.all
    @tags = Tag.all
  end

  def show
    @seller ||= User.find(@product.seller_id)
    if session[:user_id]
      @user = User.find(session[:user_id])
      @order = @user.orders.last
    end
  end 

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_hash)
    @product.seller_id = session[:user_id]
    @product.save

    if @product
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
      params.require(:product).permit(:title, :price, :description, :quantity, :product_image)
    end

    def authorize_vendor!
      authentication_required
      unless current_user.vendor?
        flash[:notice] = "You must be a vendor to do that."
        redirect_to root_path
      end 
    end 

end