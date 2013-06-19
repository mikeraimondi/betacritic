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
    @movie = Movie.find(params[:movie_id])
    @review = current_user.reviews.new(params[:review])
    @review.movie = @movie
    if @review.save
      redirect_to @movie, :notice => 'Review was successfully created'
    else
      flash[:error] = 'Review form cannot be blank.'
      render "movies/show"
    end
  end


end