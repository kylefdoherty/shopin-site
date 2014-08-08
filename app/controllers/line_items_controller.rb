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
  
  def update
   @line_item = LineItem.find(params[:id])
   @line_item.quantity = params[:line_item][:quantity]
   @line_item.save
   @order = @line_item.order
   @user = User.find(@order.buyer_id)

   if @line_item
      respond_to do |format|
        format.html 
        format.js
      end
    else
      render :edit
   end
  end  

  def destroy
    @line_item = LineItem.find(params[:id])
    @order = Order.find(@line_item.order_id) 
    @user = User.find(session[:user_id])
    @line_item.destroy

    respond_to do |format|
      format.html 
      format.js
    end

    
    
    
  end




  private
   def lineitem_params
      params.require(:line_item).permit(:item_id, :order_id, :quantity)
    end




end
