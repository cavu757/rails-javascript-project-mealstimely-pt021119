class MealSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :food_id, :cook_id
end
