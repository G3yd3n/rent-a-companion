class BookingsController < ApplicationController

  # we only need this to display the list of bookings
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
    @booking.accepted = false
    @booking.save
      redirect_to user_bookings_path(@user)
  end

  def show
    @bookings = Bookings.find(params[:id])
  end

  # def approve
  #   @booking = Booking.find(params[:id])
  #   @booking.accepted = true
  #   @booking.save
  # end

  private

  def booking_params
    params.require(:booking).permit(:date, :time, :accepted, :price, :user_id, :companion_id)
  end
end
