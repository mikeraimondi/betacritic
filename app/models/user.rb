class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :likes
  # attr_accessible :title, :body

  has_many :movies,
           foreign_key: :contributor_id,
           inverse_of: :contributor

  has_many :likes,
           inverse_of: :user,
           dependent: :destroy

  has_many  :viewings,
            inverse_of: :user,
            dependent: :destroy

  ROLES = %w[user admin]

  validates_inclusion_of :role, in: ROLES
  validates_presence_of :role

  def visit_movie(movie)
    viewing = viewings.where(viewable_id: movie.id, viewable_type: "Movie").first
    if viewing.nil?
      viewings.create(viewable: movie)
    else
      viewing.touch
    end
  end

  def admin?
    role == 'admin'
  end

  def like_for(movie)
    likes.where("likable_id = ? AND likable_type = 'Movie'", movie.id).first
  end

  def likes_movie?(movie)
    like_for(movie).present?
  end

  # def liked_movies
  #   likes.where('likable_type = ?', 'Movie')
  # end

end
