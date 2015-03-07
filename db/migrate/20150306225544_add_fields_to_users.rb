class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birth_date, :date
    add_column :users, :fb_id, :string
  end
end
