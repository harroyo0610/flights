class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.date :date
      t.string :depart
      t.string :from
      t.string :to
      t.string :duration
      t.float :cost
      t.integer :passengers

      t.timestamps
    end
  end
end
