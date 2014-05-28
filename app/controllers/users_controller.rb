class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @user = User.find_by_username(params[:id])
    @posts = Post.where(user: @user)
  end
end
