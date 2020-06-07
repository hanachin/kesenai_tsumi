class PostCancellation < ApplicationRecord
  belongs_to :post, inverse_of: :cancellation
end
