class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @user = User.find(@order.buyer_id)
  end

  def update
    @order = Order.find(params[:id])
    @user = User.find(@order.buyer_id)
    if @order.update(order_hash)
      # logic for cart products to show up on seller show page to ship
      @user.orders.create
      redirect_to(@user)
    else
      render :edit
    end
  end

  private
    def order_hash
      params.require(:order).permit(:buyer_id, :closed)
    end

end
