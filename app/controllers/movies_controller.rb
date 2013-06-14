class MoviesController < ApplicationController
  def index
    @movies = Movie.find(:all, :order => 'title')
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = current_user.movies.new
  end

  def create
    @movie = current_user.movies.new(params[:movie])
    if @movie.save
      redirect_to @movie, :notice => 'Movie was successfully created'
    else
      render :action => 'new'
    end
  end
end
