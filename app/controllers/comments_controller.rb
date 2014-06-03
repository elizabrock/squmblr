class CommentsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  	@comments = Comment.all
  end

  def new
  	@comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Your comment has been created"
      redirect_to post_path (@post)
    else
      flash[:alert] = "Your comment could not be created"
      redirect_to post_path (@post)
    end
  end

  def show
  	@comment = Comment.find(params[:id])
  end

  private 

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id)
  end
end