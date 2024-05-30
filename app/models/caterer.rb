class Caterer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  CUISINES = ["French", "Italian", "Portuguese", "English"]

  include PgSearch::Model
    pg_search_scope :search_by_cuisine_and_address_and_caterer_name,
    against: [ :cuisine, :address, :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
