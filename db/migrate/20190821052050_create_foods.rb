class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :picture
      t.text :description
      t.integer :food_rating

      t.timestamps
    end
  end
end
