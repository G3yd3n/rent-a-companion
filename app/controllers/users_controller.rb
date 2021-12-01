require 'pry-byebug'
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end

  def update
    @user = User.find(params[:id])
    # binding.pry
    @user.update(user_params)
    redirect_to root_path

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
