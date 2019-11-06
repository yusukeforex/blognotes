class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  before_action :require_login

  def current_user 
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  def logged_in?
    !!current_user
  end
  # def require_user
  #   if !logged_in?
  #     flash[:danger] = "you must have logged in to do this acition"
  #     redirect_to login_path
  #   end
  # end
  # def login_required
  #   redirect_to login_path unless current_user
  # end

  private

  def require_login
    unless logged_in?
      flash[:danger] = "you mush have logged in to do this action"
      redirect_to signup_path
    end
  end
end
