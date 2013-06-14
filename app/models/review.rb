class Review < ActiveRecord::Base

  validates_presence_of :movie, :user, :rating, :body
  belongs_to :movie
  belongs_to :user

end
