# frozen_string_literal: true

class RemoveBookingIdFromPassenger < ActiveRecord::Migration[7.0]
  def change
    remove_column :passengers, :booking_id
  end
end
