class CommentsController < ApplicationController

  # Adds Comment to a Post
  @post = Post.find(params[:id])
  @user_who_commented = @current_user
  @comment = Comment.build_from( @post, @user_who_commented.id )

  # Turns Comment into a child/reply
  @comment.move_to_child_of(the_desired_parent_comment)

  # Retrieves all Comments fro a Post
  @all_comments = @post.comment_threads


  # before_action :current_resource
  # respond_to :html
  # layout 'admin'
  #
  #
  # def update
  #   @comment = Comment.find(params[:id])
  #   @comment.update_attributes(comment_params)
  #   respond_with @comment
  # end
  #
  # private
  # def comment_params
  #   params.require(:comment).permit(:created_at, :comment, :name)
  # end
  
end
