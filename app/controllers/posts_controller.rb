class PostsController < ApplicationController
  before_action :set_board
  before_action :set_post, only: %I[destroy update]

  # POST /boards/:board_id/posts
  # POST /boards/:board_id/posts.json
  def create
    @new_post = @board.posts.new(new_post_params)

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

  # PATCH/PUT /boards/:board_id/posts/1
  # PATCH/PUT /boards/:board_id/posts/1.json
  def update
    respond_to do |format|
      if @post.update(update_post_params)
        format.html { redirect_to @board, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def new_post_params
      params.require(:post).permit(:poster, :body)
    end

    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_post
      @post = @board.posts.find(params[:id])
    end

    def update_post_params
      params.require(:post).permit(:body)
    end
end
