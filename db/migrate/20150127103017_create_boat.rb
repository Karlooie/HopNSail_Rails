class CreateBoat < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string  :name
      t.string  :avatar
      t.string  :boat_type
      t.string  :make
      t.string  :model
      t.integer :year
      t.decimal :lenght
      t.timestamps
    end
  end
end
