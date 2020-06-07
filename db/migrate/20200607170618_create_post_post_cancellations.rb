class CreatePostPostCancellations < ActiveRecord::Migration[6.0]
  def change
    create_table :post_post_cancellations do |t|
      t.references :post, null: false, foreign_key: true
      t.references :post_cancellation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
