require 'pry-byebug'
class UsersController < ApplicationController

  def new
    @user = User.new
    @user.build_companion
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @companion = Companion.where(user_id: @user.id)
    if @companion.exists?
      p "He/She is a companion!"
    else
      p "Not a companion!"
      p "provide to create companion"
    end
    # binding.pry
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
    params.require(:user).permit(:first_name, :last_name, companion_attributes: [:description, :price])
  end
end
