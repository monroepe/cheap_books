class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :url, null: false
      t.string :title, null: false
      t.text :description
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
