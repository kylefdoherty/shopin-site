class SessionsController < ApplicationController
  skip_before_action :authentication_required, only: :create

  def create
    @user = User.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid]) || User.create_with_omniauth(auth_hash)
    @user.orders.create if @user.orders.last.closed
    session[:user_id] = @user.id
    session[:current_user] = @user
    flash[:notice] = "Thanks for signing in, #{@user.name}!"
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  def auth_hash
    env['omniauth.auth']
  end

end
