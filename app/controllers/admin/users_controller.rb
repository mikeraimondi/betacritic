class Admin::UsersController < AdminController

  before_filter :authorize_user

  def index
    # unless current_user && current_user.admin?
    #   redirect_to root_path, notice: 'You are not authorized!'
    # end
    @users = User.all
  end

  def show
    # unless current_user && current_user.admin?
    #   redirect_to root_path, notice: 'You are not authorized!'
    # end
    @user = User.find(params[:id])
  end

  protected

  def authorize_user
    redirect_to root_path, notice: 'You are not authorized!' unless current_user && current_user.admin?
  end
end
