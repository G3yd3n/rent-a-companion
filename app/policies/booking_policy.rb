class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def index?
      true
    end

    # Any user can make a new booking
    def new?
      create?
    end

    # Any user can create a booking
    def create?
      true
    end

    def show?
      true
    end

    # Only companions can accept or reject bookings
    def approve?
      record.companion_id == user
    end
  end
end
