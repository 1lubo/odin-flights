# frozen_string_literal: true

class RemoveBookingIdFromFlights < ActiveRecord::Migration[7.0]
  def change
    remove_column :flights, :booking_id
  end
end
