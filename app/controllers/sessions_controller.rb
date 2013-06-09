class SessionsController < ApplicationController
  def new
  end

	def create
		auth_hash = request.env['omniauth.auth']
		
#		render :text => auth_hash["info"]["first_name"]
		
		
		user = User.find_by_facebook_id(auth_hash["uid"])
		
		if user != nil
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
end
