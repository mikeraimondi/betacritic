class MoviesController < ApplicationController
  def index
    @movies = Movie.find(:all, order: 'title')
  end

  def show
    @movie = Movie.find(params[:id])
<<<<<<< HEAD
    @like = @movie.likes.new
=======
    current_user.visit_movie(@movie) if user_signed_in?
      # viewings = @movie.viewings.where("user_id = ?", current_user.id)
      # if viewings.count == 1
      #   viewings.first.touch
      # else
      #   current_user.viewings.create(viewable: @movie)
      # end
    # end
>>>>>>> 918db1efc2f692869bd33338870157cfae0c03d9
  end

  def new
    @movie = current_user.movies.new
  end

  def create
    @movie = current_user.movies.new(params[:movie])
    if @movie.save
      redirect_to @movie, notice: 'Movie was successfully created'
    else
      render action: 'new'
    end
  end
end
