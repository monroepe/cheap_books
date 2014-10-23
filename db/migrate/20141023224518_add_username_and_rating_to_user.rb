class AddUsernameAndRatingToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :rating, :integer, default: 0
  end
end
