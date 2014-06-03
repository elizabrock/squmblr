class RatingsController < ApplicationController

  def show
    @rating = Rating.find(rating_params)
  end

  def create
    current_user.ratings.create!(rating_params)
    redirect_to posts_path
  end

  def update
    @rating = Rating.find(params[:rating][:post_id])
    @rating.update!(:opinion => params[:rating][:opinion])
    redirect_to posts_path
  end
  private

  def rating_params
    params.require(:rating).permit(:post_id, :opinion)
  end
end
