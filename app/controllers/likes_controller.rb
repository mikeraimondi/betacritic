class LikesController < ApplicationController
  # before_filter :authenticate_user!

  def index
    @likes = @likable.likes
  end

  def create
    @like = current_user.likes.new(params[:like])
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
end
