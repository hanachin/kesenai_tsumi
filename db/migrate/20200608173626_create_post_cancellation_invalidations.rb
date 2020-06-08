class CreatePostCancellationInvalidations < ActiveRecord::Migration[6.0]
  def change
    create_table :post_cancellation_invalidations do |t|
      t.references :post_cancellation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
