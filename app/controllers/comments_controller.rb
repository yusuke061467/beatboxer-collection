class CommentsController < ApplicationController
  before_action :require_login

  def create
    @comment = Comment.new(body: "aaaaaaaa", user_id: 1, post_id: 22)
    @post = Post.find(params[:id])
    if @comment.save
      redirect_to root_path
    else
      render "posts/show", status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
