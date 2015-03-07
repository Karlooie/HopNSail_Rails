class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :date
    add_column :users, :fb_id, :string
  end
end
