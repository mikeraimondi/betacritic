class Movie < ActiveRecord::Base
  attr_accessible :title, :year, :contributor_id, :likes

  validates_presence_of :title, :year, :contributor

  validates :year, numericality: { greater_than_or_equal_to: 1850, less_than_or_equal_to: 2500 }

<<<<<<< HEAD
  belongs_to :contributor, class_name: 'User',
    foreign_key: 'contributor_id',
    inverse_of: :movies

  has_many :likes, as: :likable, dependent: :destroy
end
=======
  belongs_to  :contributor, class_name: 'User',
              foreign_key: 'contributor_id',
              inverse_of: :movies

  has_many  :viewings,
            as: :viewable
end
>>>>>>> 918db1efc2f692869bd33338870157cfae0c03d9
