class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @companion = Companion.find(params[:companion_id])
    @booking = Booking.new(params[:booking])
  end

  def create
    @booking = Booking.new(booking_params)
    @companion = Companion.find(params[:companion_id])
    @booking.companion = @companion
    @booking.user = current_user
    @booking.price = @companion.price
    @booking.accepted = true
    @booking.save
      redirect_to bookings_path
  end

  def show
    @bookings = Bookings.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time, :accepted, :price, :user_id, :companion_id)
  end
end
