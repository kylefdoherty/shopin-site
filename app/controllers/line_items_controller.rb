class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:update, :destroy]

  def create
    if lineitem_params[:id].empty?
      @line_item = LineItem.create(lineitem_params)
    else
      @line_item = LineItem.find(lineitem_params[:id])
      @line_item.quantity += lineitem_params[:quantity].to_i
      @line_item.save
    end

    @order = @line_item.order
    @user = User.find(@order.buyer_id)

    if @line_item
      redirect_to(user_order_path(@user, @order))
    else
      render :edit
    end
  end 
  
  def update
    @line_item.quantity = lineitem_params[:quantity]
    @line_item.status = lineitem_params[:status] if lineitem_params[:status]
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
    @order = @line_item.order
    @user = User.find(session[:user_id])
    @line_item.destroy

    respond_to do |format|
      format.html 
      format.js
    end

  end

  private
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def set_user
      @user = User.find(session[:user_id])
    end

    def set_order
      @order = User.find(session[:user_id]).orders.last
    end
    
    def lineitem_params
      params.require(:line_item).permit(:id, :item_id, :order_id, :quantity, :status)
    end

end
