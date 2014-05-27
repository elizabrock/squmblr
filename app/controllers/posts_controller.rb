class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to "/posts"
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
