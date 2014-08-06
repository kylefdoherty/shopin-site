class LineItemsController < ApplicationController

  def create 
    @line_item = LineItem.create(lineitem_params)
    @order = @line_item.order
    @user = User.find(@order.buyer_id)

    if @line_item
      redirect_to(user_order_path(@user, @order))
    else
      render :edit
    end

  end 




  private
   def lineitem_params
      params.require(:line_item).permit(:item_id, :order_id)
    end




end
