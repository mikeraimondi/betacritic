class ReviewsController < ApplicationController
  def index
    @reviews = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  # def new
  #   @review = Review.new
  #   @movie = Movie.find(params[:movie_id])
  # end

  def create
    @review = current_user.reviews.new(params[:review])
    if @review.save
      redirect_to @review, :notice => 'Review was successfully created'
    else
      render :action => 'new'
    end
  end
end

# class MoviesController < ApplicationController
#   def index
#     @movies = Movie.find(:all, :order => 'title')
#   end

#   def show
#     @movie = Movie.find(params[:id])
#   end

#   def new
#     @movie = current_user.movies.new
#   end

#   def create
#     @movie = current_user.movies.new(params[:movie])
#     if @movie.save
#       redirect_to @movie, :notice => 'Movie was successfully created'
#     else
#       render :action => 'new'
#     end
#   end
# end
