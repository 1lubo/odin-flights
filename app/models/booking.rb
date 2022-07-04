# frozen_string_literal: true

class Booking < ApplicationRecord
  has_one :flight
  has_many :passengers
  accepts_nested_attributes_for :passengers
end
