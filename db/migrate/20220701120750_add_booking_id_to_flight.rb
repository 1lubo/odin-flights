# frozen_string_literal: true

class AddBookingIdToFlight < ActiveRecord::Migration[7.0]
  def change
    change_table :flights do |t|
      t.belongs_to :booking
    end
  end
end
