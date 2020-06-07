class AddCancelledAtToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :cancelled_at, :datetime
  end
end
