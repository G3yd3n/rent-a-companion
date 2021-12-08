class CompanionsController < ApplicationController
  def index
    # if params[:query].present?
    #   @companions = Companion.where("first_name ILIKE ?", "%#{params[:query]}%")
    if params[:query].present?
      sql_query = " \
        users.first_name @@ :query \
        OR users.last_name @@ :query \
      "
      @companions = Companion.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @companions = Companion.all
    end
  end

  def show
    @companion = Companion.find(params[:id])
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
      render :new
    end
  end

  def new
    @companion = Companion.new
  end

  private
  def companion_params
    params.require(:companion).permit(:description, :price, photos: [])
  end
end
