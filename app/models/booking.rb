class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :companion
  validates :date, presence: true
  # validates_date :date, on_or_before: :today
  validates :time, presence: true
  # validates :user_id, uniqueness: true
  validates :accepted, inclusion: { in: [ true, false ] }
  validates :user_id, uniqueness: { scope: :companion_id }
end
