class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @posts = Post.all
    if (current_user != nil)
      @follows = []
      @follow_posts = []
      user_follows = Follow.where(follower_id: current_user.id)
      user_follows.each do |follow|
        followed_user = User.find_by(id: follow.followee_id)
        @follows << followed_user
        @follow_posts << Post.where(user_id: followed_user.id)
      end
      @follow_posts = @follow_posts.flatten
    end
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
    params.require(:post).permit(:content, :user_id)
  end
end
