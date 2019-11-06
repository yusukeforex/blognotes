class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new

  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id 
      flash[:success] = "you have logged in"
      redirect_to user_path(user)
    else
      flash[:danger] = "sth wrong"
      render 'new'
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = "you have logged out"
    redirect_to login_path
  end
end