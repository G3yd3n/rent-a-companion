class RemoveBookingDateFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :booking_date, :datetime
  end
end
