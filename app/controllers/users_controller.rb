class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]
  def new 
    @user = User.new
  end
  def create 
    @user = User.create params.require(:user).permit(:name, :email, :email_confirmation, :password, :password_confirmation, :image)
    if @user.save
      flash[:success] = "User was successfully created"
      redirect_to login_path
    else 
      render 'new'
    end
  end
  def index
    @users = User.all
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update params.require(:user).permit(:name, :email, :email_confirmation, :image)
      flash[:success] = "Has been updated successfully"
      redirect_to notes_path
    else
      render 'edit'
    end
  end
  def show 
    @user = User.find(params[:id])
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "user was deleted"
    redirect_to login_path
  end


  private 
  def user_params
    params.require(:user).permit(:name, :email, :email_confirmation, :password, :password_confirmation)
  end
  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "only edit or delete are allowed"
      redirect_to login_path
    end
  end
  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "you are not admin user"
      redirect_to login_path
    end
  end
end