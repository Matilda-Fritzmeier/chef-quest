class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :date
      t.string :location
      t.datetime :start_hour
      t.datetime :end_hour
      t.float :total_price
      t.boolean :confirmed, default: false
      t.references :user, null: false, foreign_key: true
      t.references :caterer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
