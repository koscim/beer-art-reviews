class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user

  def index
    @users = User.order(created_at: :desc)
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.role == 'member'
      @user.update(role: 'admin')
      redirect_to admin_users_path, notice: "User Successfully Given Admin Rights!"
    else
      @user.update(role: 'member')
      redirect_to admin_users_path, notice: "User Successfully Demoted!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end
end
