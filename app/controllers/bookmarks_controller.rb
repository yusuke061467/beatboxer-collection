class BookmarksController < ApplicationController
  before_action :require_login

  def index
  end

  def create
    # binding.pry
    @post = Post.find(params[:post_id])
    current_user.bookmark(@post)
  end

  def destroy
    # binding.pry
    @post = current_user.bookmarks.find(params[:id]).post
    current_user.unbookmark(@post)
  end
end
