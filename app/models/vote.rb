class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  validates :recipe_id, :user_id, presence: :true
end
