class MealSerializer < ActiveModel::Serializer
  attributes :id, :meal_name
  belongs_to :user
  belongs_to :food
  has_many :comments
end
