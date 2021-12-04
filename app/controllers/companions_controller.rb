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

  private
  def companion_params
    params.require(:companion).permit(:description, :price)
  end
end
