class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :user
      t.text :body
      # When a book is deleted, delete all associated reviews
      t.references :book, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
