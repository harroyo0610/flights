class UserBooking < ActiveRecord::Migration[5.0]
  def change
    create_table :user_bookings do |t|
      t.belongs_to :user, index: true
      t.belongs_to :booking, index: true

      t.timestamps
    end
  end
end
