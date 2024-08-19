class Offer < ApplicationRecord
  belongs_to :user
  has_one :booking

  validates :plant, :price, presence: true
end
