class LikesController < ApplicationController
  before_filter :load_likable

  def index
    @likes = @likable.likes
  end

  def create
    @like = @movie.likes.new(params[:like])
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
  end

private

  def load_likable
    @movie = Movie.find(params[:])
    @likable = Movie.find(params[:contributor_id])
  end

end