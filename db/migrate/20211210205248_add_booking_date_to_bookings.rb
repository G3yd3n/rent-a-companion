class AddBookingDateToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :booking_date, :datetime
  end
end
