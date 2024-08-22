class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :plant_name, :price, presence: true

  include PgSearch::Model

  pg_search_scope :global_search,
  against: [ :plant_name, :plant_description ],
  associated_against: {
    user: [:username]
  },
  using: {
    tsearch: { prefix: true }
  }

end
