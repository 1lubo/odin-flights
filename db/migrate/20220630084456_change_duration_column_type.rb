# frozen_string_literal: true

class ChangeDurationColumnType < ActiveRecord::Migration[7.0]
  def change
    remove_column :flights, :duration
    add_column :flights, :duration, :integer
  end
end
