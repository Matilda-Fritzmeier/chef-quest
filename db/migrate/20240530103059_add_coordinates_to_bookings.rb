class AddCoordinatesToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :lat, :float
    add_column :bookings, :long, :float
  end
end
