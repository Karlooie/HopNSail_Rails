class AddFieldsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :birthday, :date
    add_column :users, :fb_id, :string
  end

  def down
    add_column :users, :birth_date, :date
    add_column :users, :fb_id, :string
  end

end
