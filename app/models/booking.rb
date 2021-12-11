class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :companion
  validates :date, presence: true
  # validate :booking_date_cannot_be_in_the_past
  # validates :user_id, uniqueness: true
  validates :accepted, inclusion: { in: [ true, false ] }
  validates :user_id, uniqueness: { scope: :companion_id }


  # def booking_date_cannot_be_in_the_past
  #   errors.add(:date, "Booking date can't be in the past") if
  #     !date.blank? and date < Date.today
  # end
end
