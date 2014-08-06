class UsersController < ApplicationController

  def show
    @user = User.find(session[:user_id])
  end 

  def new
  end 

  def create
  end 

  def edit
    @user = User.find(session[:user_id])
  end 

  def update
    @user = User.find(session[:user_id])
    if @user.update(user_params)
      redirect_to(@user)
    else
      render :edit
    end
  end 

  private
    def user_params
      params.require(:user).permit(:name, :email, :vendor)
    end 



end
