class SessionsController < ApplicationController
  def new
  end

	def create
		auth_hash = request.env['omniauth.auth']
		
#		render :text => auth_hash["info"]["first_name"]
		
		session[:brand_redirect] = "/startups"
		
		user = User.find_by_facebook_id(auth_hash["uid"])
		
		if user != nil && user.startup_id != 0
			set_logged_in_user(user.startup_id)
			redirect_to(:action => "index", :controller => "startups")
		else
			nombre = auth_hash["info"]["first_name"]
			user = User.new(:facebook_id => auth_hash["uid"], :name => nombre)
			user.save
			session[:facebook_id] = auth_hash["uid"]
	  	redirect_to(:action => "new", :controller => "startups")
	  end
		
	end

  def failure
  end
  
  def logout
  	session[:username] = nil
  	session[:facebook_id] = nil
  	session[:startup_id] = nil
  	session[:brand_redirect] = "/"
  	flash[:notice] = "You have been successfully logged out"
  	redirect_to "/"
  end
end
