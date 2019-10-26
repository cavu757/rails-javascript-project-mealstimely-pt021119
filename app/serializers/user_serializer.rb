class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_cook
  has_many :meals
  has_many :foods, through: :meals
  has_many :comments, through: :meals 
end
