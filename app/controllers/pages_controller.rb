class PagesController < ApplicationController
  def admin
    unless current_user && current_user.admin?
      redirect_to root_path, notice: 'You are not authorized!'
    end
    @users = User.all
  end
end
