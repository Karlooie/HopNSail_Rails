class AddStateOnRides < ActiveRecord::Migration
  def change
    add_column :rides, :state, :string
  end
end
