class UsersController < ApplicationController
  def index
    unless current_user && current_user.admin?
      redirect_to root_path, notice: 'You are not authorized!'
    end
    @users = User.all
  end

  def show
    unless current_user && current_user.admin?
      redirect_to root_path, notice: 'You are not authorized!'
    end
    @user = User.find(params[:id])
  end
end
