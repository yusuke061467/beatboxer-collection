class PostsController < ApplicationController
    skip_before_action :require_login, only: [ :index ]
    skip_before_action :check_mfa, only: [ :index ]

    def bookmarks
        bookmarks = Bookmark.where(user_id: current_user.id)

        if bookmarks.blank?
            flash[:alert] = "ブックマークが登録されていません！"
            redirect_to root_path
        end

        @bookmark_list = Post.where(id: bookmarks.pluck(:post_id)).page(params[:page]).per(12)
    end

    def index
        @posts = Post.order(id: :desc).page(params[:page]).per(12)
      # binding.pry
    end

    def show
        @post = Post.find(params[:id])
        @comment = Comment.new
        @comments = @post.comments.includes(:user).order(created_at: :desc)
    end

    def new
        @post = Post.new
    end

    def create
        post = Post.new(post_params)
        if post.save
            flash[:notice] = "投稿しました！"
            redirect_to root_path
        else
            flash.now[:alert] = "投稿できませんでした！"
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def post_params
      params.require(:post).permit(:title, :youtube_video, :body).merge(user_id: current_user.id)
    end
end
