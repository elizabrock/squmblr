class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Your squmbl has been created"
      redirect_to posts_path
    else
      flash[:alert] = "Your squmbl could not be created"
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :image)
  end
end
