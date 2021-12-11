class ReviewsController < ApplicationController
  def new
    @companion = Companion.find(params[:companion_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @companion = Companion.find(params[:companion_id])
    @review.companion = @companion
    @review.save
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
