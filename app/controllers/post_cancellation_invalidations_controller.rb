class PostCancellationInvalidationsController < ApplicationController
  before_action :set_board
  before_action :set_post
  before_action :set_cancellation

  # POST /boards/:board_id/posts/:post_id/cancellation/invalidation
  # POST /boards/:board_id/posts/:post_id/cancellation/invalidation.json
  def create
    respond_to do |format|
      if @cancellation.create_invalidation
        format.html { redirect_to @board, notice: 'PostCancellationInvalidation was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render 'boards/show' }
        format.json { render json: @cancellation.invalidation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_cancellation
      @cancellation = @post.cancellation
    end

    def set_post
      @post = @board.posts.find(params[:post_id])
    end
end
