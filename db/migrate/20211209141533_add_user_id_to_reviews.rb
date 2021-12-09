class AddUserIdToReviews < ActiveRecord::Migration[6.1]
  def up
    remove_column :reviews, :user
    add_reference :reviews, :user, foreign_key: true
  end

  def down
    remove_reference :reviews, :user, foreign_key: true
    add_column :reviews, :user, :string
  end
end
