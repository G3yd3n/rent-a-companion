class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.time :time
      t.references :user, null: false, foreign_key: true
      t.integer :price
      t.boolean :accepted

      t.timestamps
    end
  end
end
