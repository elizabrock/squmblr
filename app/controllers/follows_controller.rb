class FollowsController < ApplicationController
  def create
    user_to_follow = User.find_by_id(params[:user_id])
    Follow.create!(followee_id: user_to_follow.id, follower_id: current_user.id)
  end
end
