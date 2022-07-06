# frozen_string_literal: true

class PassengerBooking < ApplicationRecord
  belongs_to :passenger
  belongs_to :booking
end
