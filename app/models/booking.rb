class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :companion
  validates :date, presence: true
  validates :time, presence: true
  validates :accepted, inclusion: [true, false]
end
