class Meal < ApplicationRecord
  belongs_to :food
  belongs_to :user
  has_many :comments

  scope :my_meal, -> (cook_id){where(cook_id: cook_id)}



end
