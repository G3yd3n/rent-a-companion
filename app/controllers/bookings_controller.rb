class BookingsController < ApplicationController

   # Current user will only see their own bookings
  def index
    @bookings = policy_scope(Booking)
    @user = current_user
    # Current user bookings are stored under @seeker_bookings
    if current_user.companion == nil
      @seeker_bookings = @bookings.select do |booking|
        booking.user_id == @current_user.id
      end
    else
      # if current user has a companion id then user's companion bookings are stored under @companion_bookings
      @companion_bookings = @bookings.select do |booking|
        booking.companion_id == @current_user.companion.id
      end
      @seeker_bookings = @bookings.select do |booking|
        booking.user_id == @current_user.id
      end
    end
    authorize @bookings
  end

  # All users can create a booking with companions
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
      # if @booking.companion_id == @user.companion_id
        @booking.accepted = true
        @booking.save
    authorize @booking
    redirect_to bookings_path(@bookings)
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time, :accepted, :price, :user_id, :companion_id)
  end
end
