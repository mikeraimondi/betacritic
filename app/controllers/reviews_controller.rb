class ReviewsController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
      if user_signed_in?
        @review = current_user.reviews.new(params[:review])
      else
        redirect_to movie_path
      end
    @review.movie = @movie
      if @review.save
        redirect_to @movie, :notice => 'Review was successfully created'
      else
        @like = @movie.likes.new
        render "movies/show"
      end
  end
end