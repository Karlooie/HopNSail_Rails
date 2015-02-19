class AddDurationToRides < ActiveRecord::Migration
  def change
    add_column :rides, :duration, :integer
  end
end
