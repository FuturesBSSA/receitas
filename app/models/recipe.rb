class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # Favorited by users
  has_many :favorite_recipes # just the 'relationships'
  has_many :favorited_by, through: :favorite_recipes, source: :user # the actual users favoriting a recipe

  validates :name, :summary, :course, :kitchen, :photo, :description, presence: true
  validates :summary, length: { maximum: 80 }
  mount_uploader :photo, PhotoUploader

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  def self.search(search)
    where("lower(name) LIKE ? or lower(course) LIKE ? or lower(kitchen) LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    # where("lower(course) LIKE ?", "%#{search}%")
    # where("lower(kitchen) LIKE ?", "%#{search}%")
  end

  WillPaginate.per_page = 2
end
