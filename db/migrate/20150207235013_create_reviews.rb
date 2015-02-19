class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :reviewable_id
      t.string  :reviewable_type
      t.text    :content
    end
  end
end
