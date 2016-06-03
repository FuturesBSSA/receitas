class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :recipes
  has_many :reviews

# Favorite recipes of user
  has_many :favorite_recipes # just the 'relationships'
  has_many :favorites, through: :favorite_recipes, source: :recipe # the actual recipes a user favorites

  validates :first_name, :last_name, presence: true

  mount_uploader :photo, PhotoUploader

  def confirmation_required?
      false
  end
end
