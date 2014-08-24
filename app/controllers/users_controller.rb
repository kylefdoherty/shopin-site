class UsersController < ApplicationController
  before_action :set_user_from_params, only: [:show, :orders_summary]
  before_action :set_user_from_session, only: [:edit, :update]

  def update
    @user.update(user_params) ? redirect_to(@user) : render :edit
  end

  def orders_summary
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :vendor, :address, :zip, :phone, :country, :city, :state)
    end

    def set_user_from_params
      @user = User.find(params[:id])
    end

    def set_user_from_session
      @user = User.find(session[:user_id])
    end

end