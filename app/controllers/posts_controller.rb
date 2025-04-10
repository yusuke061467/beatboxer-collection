class PostsController < ApplicationController
    skip_before_action :require_login, only: [ :index ]

    def index
        @posts = Post.order(id: :desc).page(params[:page]).per(12)
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to root_path
        else
            render "new"
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
      params.require(:post).permit(:title, :youtube_video, :body)
    end
end
