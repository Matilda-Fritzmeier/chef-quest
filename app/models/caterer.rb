class Caterer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  CUISINES = ["French", "Italian", "Portuguese", "English"]
end
