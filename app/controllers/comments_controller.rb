class CommentsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.build(comment_params)
    comment.user = current_user
    if comment.save
      flash[:notice] = "Your comment has been created"
    else
      flash[:alert] = "Your comment could not be created"
    end
    redirect_to post_path (post)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id)
  end
end
