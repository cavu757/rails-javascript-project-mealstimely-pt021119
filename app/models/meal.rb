class Meal < ApplicationRecord
  belongs_to :user
  belongs_to :food
  has_many :comments

  scope :my_meal, -> (cook_id){where(cook_id: cook_id)}

end
