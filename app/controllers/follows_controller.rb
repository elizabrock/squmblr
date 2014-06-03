class FollowsController < ApplicationController
  def create
    user_to_follow = User.find_by_username(params[:user_id])
    Follow.create!(followee_id: user_to_follow.id, follower_id: current_user.id)
    flash[:notice] = "You have followed #{user_to_follow.username}."
    redirect_to user_path(current_user)
  end
end
