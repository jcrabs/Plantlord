class Offer < ApplicationRecord
  belongs_to :user
  has_one :booking

  validates :plant_name, :price, presence: true
end
