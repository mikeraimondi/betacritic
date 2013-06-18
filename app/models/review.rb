class Review < ActiveRecord::Base
  attr_accessible :movie, :body

  validates_presence_of :movie, :user, :rating, :body
  
  belongs_to  :movie,
              inverse_of: :reviews
  belongs_to  :user,
              inverse_of: :reviews

end
