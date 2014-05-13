class SessionsController < ApplicationController
	def home
    if !logged_in?
      redirect_to root_path
    elsif current_user.admin?
      redirect_to users_path
    elsif logged_in?
      redirect_to assess_path(current_user.id)
    end
	end

	def create
		user = User.from_omniauth(env["omniauth.auth"])
    set_logged_in_userid(user.id)
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

