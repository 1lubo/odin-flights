# frozen_string_literal: true

class AddScheduledTimeColumnToFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :scheduled_time, :time
  end
end
