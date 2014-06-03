class FollowsController < ApplicationController
  def create
    user_to_follow = User.find_by_username(params[:user_id])
    current_user.follows.create!(followee: user_to_follow)
    flash[:notice] = "You have followed #{user_to_follow.username}."
    redirect_to user_path(current_user)
  end
end
