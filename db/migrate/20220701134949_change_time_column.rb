# frozen_string_literal: true

class ChangeTimeColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :flights, :scheduled_time, :string
  end
end
