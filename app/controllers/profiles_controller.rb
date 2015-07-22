class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    @user = User.find(@profile.user_id)
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    logger.debug "hello this is a long string of text just begcause it's so damn hard to see in the cluster &&&& that is teh console"
    logger.debug @profile.inspect
    logger.debug ""
    if @profile.save
      # redirect_to @profile_show
      redirect_to @profile
      # redirect_to @profiles
      # redirect_to @profiles_show

    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :image, :bio)
  end
end