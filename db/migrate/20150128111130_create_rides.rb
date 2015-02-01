class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.integer     :user_id
      t.integer     :boat_id
      t.string      :ride_type
      t.string      :availability
      t.datetime    :starting_at
      t.datetime    :finishing_at
      t.timestamps
    end
  end
end
