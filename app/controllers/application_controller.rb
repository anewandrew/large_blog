class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for resource
  	logger.debug "hello world, before if"
  	if !current_user.profile
  		profiles_new_path
  	else
  		profile_path current_user.profile.id
  	end
  end
end