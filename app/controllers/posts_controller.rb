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
      published = params[:post][:published]
      flash[:notice] = published ? "Your squmbl has been created!" : "Your squmbl has been saved as a draft!"
      if published
        redirect_to posts_path
      else
        redirect_to user_path(current_user)
      end
    else
      flash[:alert] = params[:post][:published] ? "Your squmbl could not be created." : "Your squmbl could not be saved."
      render :new
    end
  end

  def update
    @post = Post.find_by_id(params[:id])
    #@post.content = params[:post][:content]
    if @post.update(content: params[:post][:content])
      flash[:notice] = "Your squmbl has been saved."
      redirect_to posts_path
    else
      flash[:alert] = "Your squmbl could not be saved."
      redirect_to posts_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update_published_param
    return unless params[:post]
    is_draft = (params.delete(:commit) == "save as draft")
    params[:post][:published] = is_draft ? false : true
  end

  private

  def post_params
    params.require(:post).permit(:content, :published)
  end

end
