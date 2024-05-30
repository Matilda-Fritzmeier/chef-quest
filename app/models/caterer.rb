class Caterer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  CUISINES = ["French", "Italian", "Portuguese", "English"]

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # validates :address, presence: true
end
