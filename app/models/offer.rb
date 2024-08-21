class Offer < ApplicationRecord
  belongs_to :user
  has_one :booking
  has_one_attached :photo

  validates :plant_name, :price, presence: true
end
