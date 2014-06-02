class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  before_action :update_published_param, on: [:create, :update]

  def index
    @posts = Post.published.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      if @post.published
        redirect_to posts_path, :notice => "Your squmbl has been created!"
      else
        redirect_to user_path(current_user), :notice => "Your squmbl has been saved as a draft!"
      end
    else
      flash[:alert] = @post.published ? "Your squmbl could not be created." : "Your squmbl could not be saved."
      render :new
    end
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.update(content: params[:post][:content], published: params[:post][:published])
      if @post.published
        redirect_to posts_path, :notice => "Your squmbl has been created!"
      else
        redirect_to user_path(current_user), :notice => "Your squmbl has been saved as a draft!"
      end
    else
      flash[:alert] = @post.published ? "Your squmbl could not be created." : "Your squmbl could not be saved."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update_published_param
    return unless params[:post]
    is_published = (params.delete(:commit) == "create squmbl")
    params[:post][:published] = is_published ? true : false
  end

  private

  def post_params
    params.require(:post).permit(:content, :published)
  end

end
