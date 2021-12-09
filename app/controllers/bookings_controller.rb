class BookingsController < ApplicationController

   # Current user will only see their own bookings
  def index
    # @bookings = Booking.all
    @user = current_user
    @booking = policy_scope(Booking)
    # @user_bookings = @booking.select do |booking|
    #   booking.user_id == @user
    # end
    authorize @booking
  end

  # All users can create a booking with a companion
  def new
    @companion = Companion.find(params[:companion_id])
    @booking = Booking.new(params[:booking])
  end

  #
  def create
    @booking = Booking.new(booking_params)
    @companion = Companion.find(params[:companion_id])
    @booking.companion = @companion
    @booking.user = current_user
    @booking.price = @companion.price
    @booking.accepted = false
    @booking.save
    authorize @booking
    redirect_to bookings_path(@bookings)
  end

  # Only companions can approve booking requests
  def accept
    @booking = Booking.find(params[:id])
    @user = current_user
      # If the companion_id of a booking matches the current user's companion id
      if @booking.companion_id == @user.companion_id
        @booking.accepted = true
        @booking.save
      else
        puts "??????"
      end
    authorize @booking
    redirect_to bookings_path(@bookings)
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time, :accepted, :price, :user_id, :companion_id)
  end
end
