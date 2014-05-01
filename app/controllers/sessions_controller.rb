class SessionsController < ApplicationController
	def home
	end

	def create
		user = User.from_omniauth(env["omniauth.auth"])
    set_logged_in_userid(user.id)
    puts "* * * #{user.to_yaml}"
	end

  def test_login
    user = User.from_fakeuser(params[:nickname])
    set_logged_in_userid user.id
    user.team_id = 1
    user.save!
  end

  def set_logged_in_userid id
    session[:user_id] = id
    redirect_to assess_path(id), notice: "Signed in."
  end
end

