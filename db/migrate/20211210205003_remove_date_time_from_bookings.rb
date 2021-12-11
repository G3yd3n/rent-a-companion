class RemoveDateTimeFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :date, :date
    remove_column :bookings, :time, :time
  end
end
