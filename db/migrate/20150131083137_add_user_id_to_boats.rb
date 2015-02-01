class AddUserIdToBoats < ActiveRecord::Migration
  def change
    add_column :boats, :user_id, :integer
  end
end
