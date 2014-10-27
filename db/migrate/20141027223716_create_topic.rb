class CreateTopic < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.integer :user_id, null: false
      t.integer :genre_id, null: false

      t.timestamps
    end
  end
end
