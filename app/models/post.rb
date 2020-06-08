class Post < ApplicationRecord
  belongs_to :board
  has_one :post_post_cancellation, dependent: :destroy
  has_one :cancellation, class_name: 'PostCancellation', through: :post_post_cancellation, source: :post_cancellation
  has_many :post_cancellations, dependent: :destroy

  validates :poster, :body, presence: true

  def cancelled?
    !cancellation.nil?
  end

  def display_body
    cancelled? ? body : 'This post is deleted.'
  end
end
