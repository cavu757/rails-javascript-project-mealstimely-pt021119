class FoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :picture, :description, :cook
end
