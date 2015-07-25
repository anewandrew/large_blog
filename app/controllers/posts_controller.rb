class PostsController < ApplicationController
  def index
    @posts = Post.all
    # @posts.each do |post|
    # end
    # @post = Post.find(params[:user_id])
  end
  def show
    set_post
    get_profile
  end
  def new
    @post = Post.new
    if !user_signed_in?
      redirect_to profiles_index_path
    end
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
    set_post
    set_post_protected
  end
  def update
    set_post
    if @post.update(post_params)
      redirect_to @post
    else
      render 'new'
    end
  end
  def destroy
    set_post
    @post.destroy
    redirect_to profile_path(current_user.profile.id)
  end

  private
  def get_profile
    @profile = Profile.find_by_user_id(@post.user_id)
  end
  def set_post
    @post = Post.find(params[:id])
  end
  def set_post_protected
    if @post.user_id != current_user.id
      redirect_to root_path
    end
  end
  def post_params
    params.require(:post).permit(:title, :image, :content)
  end

end