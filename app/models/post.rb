class Post < ApplicationRecord
  belongs_to :board

  validates :poster, :body, presence: true

  def cancel(at: Time.zone.now)
    self.cancelled_at = at
    save
  end

  def cancelled?
    !cancelled_at.nil?
  end

  def display_body
    cancelled_at.nil? ? body : 'This post is deleted.'
  end
end
