class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at
  belongs_to :user
  belongs_to :meal

  def created_at
    date = object.created_at.strftime("%d %b %Y at%l:%M %p")
  end

end
