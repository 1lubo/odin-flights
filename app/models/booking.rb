# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passenger_bookings, dependent: :delete_all
  has_many :passengers, through: :passenger_bookings, inverse_of: :bookings

  accepts_nested_attributes_for :passengers

  validates :passengers, :flight, presence: true
  validates_associated :passengers

  before_validation :find_or_create_passenger
  after_validation :collect_errors

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

  private

  def find_or_create_passenger
    self.passengers = passengers.map do |pax|
      Passenger.find_or_create_by(name: pax.name, email: pax.email)
    end
  end
end
