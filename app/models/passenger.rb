# frozen_string_literal: true

class Passenger < ApplicationRecord
  has_many :passenger_bookings, dependent: :delete_all
  has_many :bookings, through: :passenger_bookings, inverse_of: :passengers
  has_many :flights, through: :bookings

  validates :name, presence: { message: 'Name must not be empty' }
  validates :name, length: { minimum: 3, too_short: 'Name must be at least 3 characters' }
  validates :email, presence: { message: 'Email must not be empty' }
  validates :email, uniqueness: true, if: -> { !email.blank? }
end
