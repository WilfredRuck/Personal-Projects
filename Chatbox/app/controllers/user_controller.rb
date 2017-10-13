class UserController < ApplicationController
	def show
		@user_page = User.find_by(username: params[:username])
	end
end
