class ApplicationController < ActionController::Base
  protect_from_forgery


  def is_logged_in?
  	return session[:user_id]
  end

  def set_logged_in_user(user_id)
  	session[:user_id] = user_id
  end

  def get_logged_in_user
  	return session[:user_id]
  end

end
