class PostsController < ApplicationController
  def index
    @posts = Post.all
    # @posts.each do |post|

    # end
    # @post = Post.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    get_profile
  end

  def new
    
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      render 'new'
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to profile_path(current_user.profile.id)
  end

  private
  def get_profile
    @profile = Profile.find_by_user_id(@post.user_id)
  end
  def post_params
    params.require(:post).permit(:title, :image, :content)
  end

end