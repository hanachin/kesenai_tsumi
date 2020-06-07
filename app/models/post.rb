class Post < ApplicationRecord
  belongs_to :board
  has_one :cancellation, class_name: 'PostCancellation', dependent: :destroy

  validates :poster, :body, presence: true

  def cancelled?
    !cancellation.nil?
  end

  def display_body
    cancelled? ? body : 'This post is deleted.'
  end
end
