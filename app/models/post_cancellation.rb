class PostCancellation < ApplicationRecord
  belongs_to :post
  has_one :post_post_cancellation, dependent: :destroy
end
