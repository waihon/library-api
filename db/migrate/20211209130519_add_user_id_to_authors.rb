class AddUserIdToAuthors < ActiveRecord::Migration[6.1]
  def change
    add_reference :authors, :user, foreign_key: true
  end
end
