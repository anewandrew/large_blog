class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
    set_profile
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
    set_profile
    set_profile_protected
  end

  def update
    set_profile
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
  def set_profile
    @profile = Profile.find(params[:id])
  end
  def profile_params
    params.require(:profile).permit(:name, :image, :bio)
  end

  def set_profile_protected
    if @profile.user_id != current_user.id
      redirect_to root_path
    end
  end
  
end