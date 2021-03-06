class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :article_id, null: false
      t.integer :user_id, null: false
      t.integer :value, default: 0, null: false

      t.timestamps
    end
  end
end
