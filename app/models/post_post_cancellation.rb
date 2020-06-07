class PostPostCancellation < ApplicationRecord
  belongs_to :post
  belongs_to :post_cancellation
end
