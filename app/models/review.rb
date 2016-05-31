class Review < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user

  validates :content, length: { minimum: 20 }
  validates :rating, presence: true
  validates_numericality_of :rating, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5
  validates :content, presence: true

end
