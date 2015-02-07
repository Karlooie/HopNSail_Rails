class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer  :user_id
      t.integer  :ride_id
      t.string   :state
      t.timestamps
    end
  end
end
