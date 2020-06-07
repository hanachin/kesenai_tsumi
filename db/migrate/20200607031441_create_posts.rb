class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :board, null: false, foreign_key: true
      t.string :poster
      t.text :body

      t.timestamps
    end
  end
end
