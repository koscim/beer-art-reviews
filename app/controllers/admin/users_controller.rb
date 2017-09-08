class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user

  def index
    @users = User.all
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end
end
