class Api::UsersController < ApplicationController

	respond_to :json, :xml

	def index
		@users = User.all
		respond_with @users
	end

	def create
		@user = User.create(user_params)
		respond_to do |format|
			format.xml {render xml: @user}
			format.json {render json: @user}
		end
	end

	def show
		@user = User.find_by_id(params[:id])
		respond_with @user
	end

	def update
		@user = User.find_by_id(params[:id])		
		@user.update(user_params)
		respond_with @user
	end

	def destroy
		@user = User.find_by_id(params[:id])		
		@user.destroy
		respond_with @user
	end

	private
		def user_params
			params.require(:user).permit(:name,:email,:password) if params[:user]
		end
end
