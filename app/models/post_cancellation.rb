class PostCancellation < ApplicationRecord
  belongs_to :post
  has_one :invalidation, class_name: 'PostCancellationInvalidation'
end
