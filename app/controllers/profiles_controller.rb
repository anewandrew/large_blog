class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    @user = User.find(@profile.user_id)
    @posts = Post.all
    
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to @profile
    else
      render 'new'
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render 'new'
    end
  end

  def destroy
  end

  def search
    @posts = Post.all
    @profiles = Profile.all
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :image, :bio)
  end
end