class Viewing < ActiveRecord::Base
  belongs_to  :user,
              inverse_of: :viewings
  belongs_to  :viewable,
              polymorphic: true,
              inverse_of: :viewings

  validates_presence_of :user, :viewable

  attr_accessible :viewable

  def self.recent_movies(user)
    user.viewings.where("viewable_type = ?", "Movie").order("updated_at DESC").limit(3)
  end
end
