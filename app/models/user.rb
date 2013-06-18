class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :movies,
    :foreign_key => :contributor_id,
    :inverse_of => :contributor

  has_many :likes, inverse_of: :user, dependent: :destroy

  def like_for(movie)
    likes.where("likable_id = ? AND likable_type = 'Movie'", movie.id).first
  end

  def likes_movie?(movie)
    like_for(movie).present?
  end
end
