class PostCancellationsController < ApplicationController
  before_action :set_board
  before_action :set_post

  # POST /boards/:board_id/posts/:post_id/cancellation
  # POST /boards/:board_id/posts/:post_id/cancellation.json
  def create
    respond_to do |format|
      if @post.post_cancellations.create
        format.html { redirect_to @board, notice: 'PostCancellation was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render 'boards/show' }
        format.json { render json: @post.cancellation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_post
      @post = @board.posts.find(params[:post_id])
    end
end
