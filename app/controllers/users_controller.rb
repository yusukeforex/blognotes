class UsersController < ApplicationController
  def new 
    @user = User.new
  end
  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User was successfully create"
      redirect_to users_path
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
    if @user.update(user_params)
      flash[:success] = "Has been updated successfully"
      redirect_to notes_path
    else
      render 'edit'
    end
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :email_confirmation, :password, :password_confirmation)
  end
end