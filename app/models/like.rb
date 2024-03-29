class Like < ActiveRecord::Base
  attr_accessible :likable, :likable_id, :likable_type

  belongs_to :user, inverse_of: :likes
  belongs_to :movie, inverse_of: :likes
  belongs_to :likable, polymorphic: true, inverse_of: :likes

  validates_presence_of :user, :likable

  # def self.likes(user)
  #   user.likes.where('likable_type = ?', 'Movie')
  # end
end
