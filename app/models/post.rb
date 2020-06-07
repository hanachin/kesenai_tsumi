class Post < ApplicationRecord
  belongs_to :board

  validates :poster, :body, presence: true
end
