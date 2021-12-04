class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :companion
  validates :date, presence: true
  validates :time, presence: true
  # validates :user_id, uniqueness: true
  validates :accepted, inclusion: [true, false]
  validates :user_id, uniqueness: { scope: :companion_id }
end
