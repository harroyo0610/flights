class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.belongs_to :flight, index: true
      t.integer :reservation_number
      t.float :total

      t.timestamps
    end
  end
end
