class ApplicationController < ActionController::Base
  protect_from_forgery


  def is_logged_in?
  	return session[:user_id]
  end

  def set_logged_in_user(startup_id)
  	session[:startup_id] = startup_id
  	user = User.find_by_startup_id(startup_id)
  	session[:facebook_id] = user.facebook_id
  	session[:username] = user.name
  end

  def get_logged_in_user
  	return session[:startup_id]
  end
  
end
