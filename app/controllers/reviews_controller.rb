class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params[:movie])
    if @review.save
      redirect_to @review, :notice => 'Review was successfully created'
    else
      render :action => 'new'
    end
  end
end