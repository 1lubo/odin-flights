# frozen_string_literal: true

class Booking < ApplicationRecord
  has_one :flight
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers, allow_destroy: true

  validates :passengers, :flight, presence: true
  validates_associated :passengers

  before_validation :find_or_create_passenger

  private

  def find_or_create_passenger
    self.passengers = passengers.map do |pax|
      Passenger.find_or_create_by(name: pax.name, email: pax.email)
    end
  end

  def collect_errors
    errors = []
    if self.errors.any?
      booking_errors = self.errors.full_messages
      booking_errors.delete('PASSENGER is invalid')
      errors << booking_errors.join(', ')
    end
    passengers.each do |pax|
      errors << pax.errors.messages.values.join(', ') if pax.errors.any?
    end
    errors.join(', ')
  end
end
