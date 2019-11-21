class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new

  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id 
      flash[:success] = "Logged in"
      redirect_to user_path(user)
    else
      flash.now[:alert] = "There's something wrong. Try again."
      render 'new'
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to login_url
  end
end

