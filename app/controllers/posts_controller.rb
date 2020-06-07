class PostsController < ApplicationController
  before_action :set_board

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

  private

    def set_board
      @board = Board.find(params[:board_id])
    end

    def post_params
      params.require(:post).permit(:poster, :body)
    end
end
