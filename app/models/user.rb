class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many  :movies,
            foreign_key: :contributor_id,
            inverse_of: :contributor

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
    if role == 'admin'
      true
    else
      false
    end
  end
end
