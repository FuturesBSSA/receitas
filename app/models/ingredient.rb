class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  validates :name, :quantity, :unit, presence: true
end
