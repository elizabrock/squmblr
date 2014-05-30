class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    validate_published(params[:commit])
  end

  def update
    @post = Post.find_by_id(params[:id])
    @post.content = params[:post][:content]
    validate_published(params[:commit])
  end

  def edit
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :published)
  end

  def validate_published(params)
    if params == 'save as draft'
      @post.published = false
      save_as_draft
    elsif params = 'create squmbl'
      @post.published = true
      publish_squmbl
    end
  end

  def save_as_draft
    if @post.save
      flash[:notice] = "Your squmbl has been saved as a draft!"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Your squmbl could not be saved."
      render :new
    end
  end

  def publish_squmbl
    if @post.save
      flash[:notice] = "Your squmbl has been created!"
      redirect_to posts_path
    else
      flash[:alert] = "Your squmbl could not be created."
      render :new
    end
  end
end
