class Review < ActiveRecord::Base
  attr_accessible :review, :rating

  validates_presence_of :review, :rating

  validates :rating, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }
end