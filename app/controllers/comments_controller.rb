class CommentsController < ApplicationController
  before_action :require_login

def create
  @post = Post.find(params[:post_id])
  @comment = Comment.new()
  @comments = @post.comments.includes(:user).order(created_at: :desc)
  gon.render_url = "/posts/#{params[:post_id]}"
  save_comment = @post.comments.build(comment_params)
  # binding.pry

  if save_comment.save
    flash.now[:notice] = "コメントの投稿に成功しました。"
    render "posts/show", status: :created
  else
    flash.now[:alert] = "コメントの投稿に失敗しました。"
    render "posts/show", status: :unprocessable_entity
  end
end


  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.new()
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    gon.render_url = "/posts/#{params[:post_id]}"
    comment_destroy = Comment.find(params[:id])

    if comment_destroy.destroy
      flash.now[:notice] = "コメントの削除に成功しました。"
      render "posts/show", status: :created
    else
      flash.now[:alert] = "コメントの削除に失敗しました。"
      render "posts/show", status: :bad_request
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
