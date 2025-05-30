class CommentsController < ApplicationController
  before_action :set_reloading_data

  def create
    save_comment = @post.comments.build(comment_params)

    if save_comment.save
      flash.now[:notice] = "コメントの投稿に成功しました！"
      render "posts/show", status: :created
    else
      flash.now[:alert] = "コメントの投稿に失敗しました！"
      render "posts/show", status: :unprocessable_entity
    end
  end

  def destroy
    comment_destroy = Comment.find(params[:id])

    if comment_destroy.destroy
      flash.now[:notice] = "コメントの削除に成功しました！"
      render "posts/show", status: :created
    else
      flash.now[:alert] = "コメントの削除に失敗しました！"
      render "posts/show", status: :bad_request
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def set_reloading_data
    @post = Post.find(params[:post_id])
    @comment = Comment.new()
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    @bookmarked_post = current_user.bookmark_posts.pluck(:id)
    gon.render_url = "/posts/#{params[:post_id]}"
  end
end
