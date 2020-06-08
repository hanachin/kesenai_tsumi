class PostCancellationsController < ApplicationController
  before_action :set_board
  before_action :set_post

  # POST /boards/:board_id/posts
  # POST /boards/:board_id/posts.json
  def create
    respond_to do |format|
      if @post.create_post_post_cancellation(post_cancellation: @post.post_cancellations.build)
        format.html { redirect_to @board, notice: 'PostCancellation was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render 'boards/show' }
        format.json { render json: @post.cancellation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/:board_id/posts/1/cancellation
  # DELETE /boards/:board_id/posts/1/cancellation.json
  def destroy
    @post.post_post_cancellation.destroy
    respond_to do |format|
      format.html { redirect_to @board, notice: 'PostCancellation was successfully destroyed.' }
      format.json { head :no_content }
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
