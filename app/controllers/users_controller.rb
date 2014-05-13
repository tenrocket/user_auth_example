class UsersController < ApplicationController
	skip_filter :ensure_logged_in, only: :guest_home_page

	def new
		@new_user = User.new
	end

	def create
		@new_user = User.new(user_params)
		if @new_user.save
			redirect_to new_user_path, notice: "You signed up!"
		else
			render :new, notice: "You failed."
		end
	end

	def guest_home_page

	end

	private

	def user_params
		params.require(:user).permit!
	end
end