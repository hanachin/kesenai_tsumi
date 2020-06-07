require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  test "title validation" do
    assert Board.new(title: 'board').valid?
    assert Board.new(title: '').invalid?
    assert Board.new(title: nil).invalid?
  end

  test "dependent destroy" do
    assert_difference('Post.count', -1) do
      boards(:one).destroy
    end
  end
end
