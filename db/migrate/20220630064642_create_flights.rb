# frozen_string_literal: true

class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :start
      t.time :duration
      t.belongs_to :departure_airport, class_name: 'Airport'
      t.belongs_to :arrival_airport, class_name: 'Airport'
      t.timestamps
    end
  end
end
