class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @user = User.find(@order.buyer_id)
  end

  def update
    @order = Order.find(params[:id])
    @user = User.find(@order.buyer_id)

    #push these to model as soon as get working 
    @line_items = @order.line_items

    @line_items.each do |li|
      li.item.quantity -= li.quantity
      li.item.save
    end 

    if @order.update(order_hash)
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
