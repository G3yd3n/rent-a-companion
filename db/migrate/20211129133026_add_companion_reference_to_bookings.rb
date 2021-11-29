class AddCompanionReferenceToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :companion, foreign_key: true

  end
end
