# frozen_string_literal: true

class CreatePassengerBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :passenger_bookings, id: false do |t|
      t.references :passenger, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true
      t.timestamps
    end
  end
end
