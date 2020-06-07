class CreatePostPostCancellations < ActiveRecord::Migration[6.0]
  def change
    create_table :post_post_cancellations do |t|
      t.references :post, null: false, foreign_key: true
      t.references :post_cancellation, null: false, foreign_key: true

      t.timestamps
    end
    add_index :post_post_cancellations, %I[post_id post_cancellation_id], name: 'index_post_post_cancellation_unique'
  end
end
