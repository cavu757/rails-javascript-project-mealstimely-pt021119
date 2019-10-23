class AddCookIdToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :cook_id, :integer
  end
end
