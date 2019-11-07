class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def cook
    {id: User.find(cook_id).id, name: User.find(cook_id).name}
  end
end
