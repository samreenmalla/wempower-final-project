class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end


	def create
		User.create(params[:user])
end
	
end
