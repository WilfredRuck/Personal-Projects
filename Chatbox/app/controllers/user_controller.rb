class UserController < ApplicationController
	def show
		@user_page = User.find_by(username: params[:username])
	end

	def invite_friend
		@user_page = User.find_by(username: params[:username])
		redirect_to "/users/#{@user_page.username}"
	end

end
