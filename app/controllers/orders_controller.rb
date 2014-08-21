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

    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here https://dashboard.stripe.com/account
    Stripe.api_key = "sk_test_4ZhIUWAzn1oqP11s3EVHEifJ"

    # Get the credit card details submitted by the form
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => (@order.total*100).to_i, # amount in cents, again
        :currency => "usd",
        :card => token,
        :description => params[:stripeEmail]
      )
    rescue Stripe::CardError => e
      # The card has been declined
    end

      @user.orders.create
      flash[:notice] = "Thanks, you paid #{@order.pretty_total}!"
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
