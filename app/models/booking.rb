class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :caterer

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # validates :date, presence: true
  # validates :time, presence: true
  # validates :address, presence: true
  # validates :number_of_guests, presence: true
end
