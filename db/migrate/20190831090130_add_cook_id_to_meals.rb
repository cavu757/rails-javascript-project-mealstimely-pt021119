class AddCookIdToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :cook_id, :integer
  end
end
