class BookingsController < ApplicationController
  def new
    @companion = Companion.find(params[:companion_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @companion = Companion.find(params[:companion_id])
  end

  def show
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time, :price, :accepted)
  end
end
