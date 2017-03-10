class UserFlight < ActiveRecord::Migration[5.0]
  def change
    create_table :user_flights do |t|
      t.belongs_to :user, index: true
      t.belongs_to :flight, index: true

      t.timestamps
    end
  end
end
