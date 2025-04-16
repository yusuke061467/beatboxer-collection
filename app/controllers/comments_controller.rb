class CommentsController < ApplicationController
  before_action :require_login

  def create
    # binding.pry
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.save
    redirect_to post_path(post)
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
