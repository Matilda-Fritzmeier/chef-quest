class AddColumnGuestCountToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :guests_count, :integer
  end
end
