class DropPostPostCancellations < ActiveRecord::Migration[6.0]
  def change
    drop_table :post_post_cancellations
  end
end
