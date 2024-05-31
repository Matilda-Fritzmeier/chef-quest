class ChangeColumnNameToBookings < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :lat, :latitude
    rename_column :bookings, :long, :longitude
  end
end
