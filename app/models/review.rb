class Review < ActiveRecord::Base
  attr_accessible :movie, :body, :rating

  validates_presence_of :movie, :user, :rating, :body
  validates_numericality_of :rating, greater_than: 0, less_than_or_equal_to: 10
  
  belongs_to  :movie,
              inverse_of: :reviews
  belongs_to  :user,
              inverse_of: :reviews

end
