class Movie < ActiveRecord::Base
  attr_accessible :title, :year, :contributor_id

  validates_presence_of :title, :year
  # validates_presence_of :contributors

  validates :year, :numericality => { :greater_than_or_equal_to => 1850, :less_than_or_equal_to => 2500 }
end