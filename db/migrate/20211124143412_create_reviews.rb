class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :user
      t.text :body
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
