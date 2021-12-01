class Companion < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :description, presence: true
  validates :description, length: { minimum: 50,
    too_long: "%{count} characters is the maximum allowed" }
  validates :price, numericality: { only_integer: true }
end