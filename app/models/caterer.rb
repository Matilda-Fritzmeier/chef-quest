class Caterer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  CUISINES = ["French", "Italian", "Portuguese", "English"]
end
