class RemoveCancelledAtFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :cancelled_at
  end
end
