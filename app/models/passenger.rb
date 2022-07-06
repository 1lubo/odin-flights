# frozen_string_literal: true

class Passenger < ApplicationRecord
  belongs_to :booking, optional: true
  
  validates :name, presence: { message: 'Name must not be empty' }
  validates :name, length: { minimum: 3, too_short: 'Name must be at least 3 characters' }
  validates :email, presence: { message: 'Email must not be empty' }
  validates :email, uniqueness: true
  
end
