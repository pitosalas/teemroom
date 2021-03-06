class UsersController < ApplicationController
  before_action :admin_only

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_stats = UserStats.new(@user)
  end

  private
  def admin_only
    unless logged_in? && current_user.admin?
      flash[:error] = "You must be an admin to access this section"
      redirect_to root_path
    end
  end
end
