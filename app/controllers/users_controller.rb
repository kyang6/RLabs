class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@lab = Lab.where('user_id = ?', @user)
	end
end
