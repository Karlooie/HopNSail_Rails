class AddFieldsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :birthday, :date
    add_column :users, :fb_id, :string
  end

  def down
    remove_column :users, :birth_date, :date
    remove_column :users, :fb_id, :string
  end

end
