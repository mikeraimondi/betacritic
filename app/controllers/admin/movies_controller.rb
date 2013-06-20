class Admin::MoviesController < AdminController

  before_filter :authorize_user

  def index
    @movies = Movie.find(:all, order: 'title')
  end

  protected

  def authorize_user
    redirect_to root_path, notice: 'You are not authorized!' unless current_user && current_user.admin?
  end

end
