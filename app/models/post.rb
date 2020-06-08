class Post < ApplicationRecord
  belongs_to :board
  has_one :cancellation, -> { where.missing(:invalidation) }, class_name: 'PostCancellation'
  has_many :post_cancellations, dependent: :destroy

  validates :poster, :body, presence: true

  def cancelled?
    !cancellation.nil?
  end

  def display_body
    cancelled? ? 'This post is deleted.' : body
  end
end
