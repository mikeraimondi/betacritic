class Review < ActiveRecord::Base
  attr_accessible :movie

  validates_presence_of :movie, :user, :rating, :body
  
  belongs_to :movie
  belongs_to :user

  has_many :rating

end
