class Movie < ActiveRecord::Base
  attr_accessible :title, :year, :contributor_id

  validates_presence_of :title, :year
  # validates_presence_of :contributors
end