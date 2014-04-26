class SessionsController < ApplicationController
	def home
	end

	def create
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to assess_path, notice: "Signed in."
	end

  def test_login
    user = User.from_fakeuser(params[:nickname])
    set_logged_in_userid user.id
  end

  def set_logged_in_userid id
    session[:user_id] = id
    redirect_to assess_path, notice: "Signed in."
  end
end

