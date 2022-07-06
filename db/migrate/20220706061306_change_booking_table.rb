# frozen_string_literal: true

class ChangeBookingTable < ActiveRecord::Migration[7.0]
  def change
    change_table :bookings do |t|
      t.belongs_to :flight
      t.belongs_to :passenger
    end
  end
end
