class Offer < ApplicationRecord
  belongs_to :user
  has_one :booking

  validates :plant_name, :plant_description, :price, presence: true
end
