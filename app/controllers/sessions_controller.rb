class SessionsController < ApplicationController
	def home
	end

	def create
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to assess_path, notice: "Signed in."
	end
end

