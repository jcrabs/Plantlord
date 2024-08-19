class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :duration, presence: true
end
