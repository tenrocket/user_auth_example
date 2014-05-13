class SessionsController < ApplicationController
	skip_filter :ensure_logged_in

	def new
	end

	def create
		# user = User.authenticate(params[:email], params[:password])

		user = User.find_by_email(params[:email]).try(:authenticate, params[:password])

		# user = User.find_by_email(params[:email])
		# if user
		# 	user.authenticate(params[:password])
		# end

  	if user
  		# { session: {user_id: user.id} } 
  		session[:user_id] = user.id
  		redirect_to new_user_path, notice: "logged in"
  	else
  		flash.now.alert = "invalid email or pw"
  		render :new
  	end
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_path, notice: "You logged out!"
	end
end