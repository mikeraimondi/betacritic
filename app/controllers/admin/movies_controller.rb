class Admin::MoviesController < AdminController

  def index
    @movies = Movie.order('title')
  end

end
