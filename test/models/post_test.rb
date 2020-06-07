require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @board = Board.new(title: 'board')
  end

  test "poster validation" do
    assert Post.new(board: @board, poster: 'john.doe', body: '4423').valid?
    assert Post.new(board: @board, poster: '', body: '4423').invalid?
    assert Post.new(board: @board, poster: nil, body: '4423').invalid?
  end

  test "body validation" do
    assert Post.new(board: @board, poster: 'john.doe', body: '4423').valid?
    assert Post.new(board: @board, poster: 'john.doe', body: '').invalid?
    assert Post.new(board: @board, poster: 'john.doe', body: nil).invalid?
  end
end
