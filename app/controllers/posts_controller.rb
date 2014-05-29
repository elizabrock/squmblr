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
    if params[:commit] == 'save as draft'
      @post.published = false
      if @post.save
        flash[:notice] = "Your squmbl has been saved as a draft!"
        redirect_to user_path(current_user)
      else
        flash[:alert] = "Your squmbl could not be saved"
        render :new
      end
    else
      @post.published = true
      if @post.save
        flash[:notice] = "Your squmbl has been created"
        redirect_to posts_path
      else
        flash[:alert] = "Your squmbl could not be created"
        render :new
      end
    end
  end

  def update
    @post = current_user.posts.build(post_params)
    if params[:commit] == 'save as draft'
      @post.published = false
      if @post.save
        flash[:notice] = "Your squmbl has been saved as a draft!"
        redirect_to user_path(current_user)
      else
        flash[:alert] = "Your squmbl could not be saved"
        render :new
      end
    else
      @post.published = true
      if @post.save
        flash[:notice] = "Your squmbl has been created"
        redirect_to posts_path
      else
        flash[:alert] = "Your squmbl could not be created"
        render :new
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :published)
  end
end
