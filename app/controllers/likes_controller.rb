class LikesController < ApplicationController
  before_filter :load_likable

  def index
    @likes = @likable.likes
  end

  def create
    @like = @movie.likes.new(params[:like])
    @like.user = current_user
    if @like.save
      redirect_to :back, notice: 'Like was successfully created'
    else
      redirect_to :back, notice: 'Oops! Something went wrong. Like was not created'
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_to :back
  end

private

  def load_likable
    @movie = Movie.find(params[:movie_id])
  end

end
