class Food < ApplicationRecord
  has_many :meals
  has_many :users, through: :meals
  has_many :comments, through: :meals

  scope :my_food, -> (cook_id){where(cook_id: cook_id)}
  
end
