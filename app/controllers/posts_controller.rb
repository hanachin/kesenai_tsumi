class PostsController < ApplicationController
  before_action :set_board
  before_action :set_post, only: :destroy

  # POST /boards/:board_id/posts
  # POST /boards/:board_id/posts.json
  def create
    @new_post = @board.posts.new(post_params)

    respond_to do |format|
      if @new_post.save
        format.html { redirect_to @board, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render 'boards/show' }
        format.json { render json: @new_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/:board_id/posts/1
  # DELETE /boards/:board_id/posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to @board, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def post_params
      params.require(:post).permit(:poster, :body)
    end

    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_post
      @post = @board.posts.find(params[:id])
    end
end
