class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:update, :destroy]
  before_action :set_user, only: [:create, :update, :destroy]
  before_action :set_order, only: [:create, :update, :destroy]

  def create
    @line_item = LineItem.find(lineitem_params[:id])
    if @line_item.new_record?
      @line_item = LineItem.create(lineitem_params)
    else
      @line_item.quantity += lineitem_params[:quantity].to_i
      @line_item.save
    end

    if @line_item
      redirect_to(user_order_path(@user, @order))
    else
      render :edit
    end
  end 
  
  def update
    @line_item.quantity = params[:line_item][:quantity]
    @line_item.status = params[:line_item][:status]
    @line_item.save

    if @line_item
      redirect_to(user_order_path(@user, @order))
    else
      render :edit
    end
  end  

  def destroy 
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
