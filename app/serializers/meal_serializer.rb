class MealSerializer < ActiveModel::Serializer
  attributes :id, :meal_name, :created_at
  belongs_to :user
  belongs_to :food
  has_many :comments

  def created_at
    date = object.created_at.strftime("%d %b %Y") 
  end
end
