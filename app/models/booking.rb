class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :companion
  validates :date, presence: true
  validates :time, presence: true
  validates :time, on_or_before: lambda { Date.current }
  validates :accepted, inclusion: [true, false]
end
