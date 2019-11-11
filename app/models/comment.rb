class Comment < ApplicationRecord
  validates :content, :user_id, presence: true
  belongs_to :meal
  belongs_to :user
end
