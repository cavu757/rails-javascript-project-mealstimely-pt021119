class CommentSerializer < ActiveModel::Serializer
  attributes :id, :meal_id, :user_id, :content
  belongs_to :user
  belongs_to :meal
end
