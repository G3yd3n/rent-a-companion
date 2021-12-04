class CompanionsController < ApplicationController
  def index
    @companions = Companion.all
  end

  def edit
    @companion = Companion.find(params[:id])
  end

  def update
    @companion = Companion.find(params[:id])
    @companion.update(companion_params)
    redirect_to root_path
  end

  def create
    @companion = Companion.new(companion_params)
    @companion.user_id = current_user.id
    if @companion.save
      redirect_to companions_path
    else
      puts "can't be save!!!!!!!!"
    end
  end

  def new
    @companion = Companion.new
  end

  private
  def companion_params
    params.require(:companion).permit(:description, :price)
  end
end
