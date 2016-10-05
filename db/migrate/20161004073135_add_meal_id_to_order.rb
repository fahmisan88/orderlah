class AddMealIdToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :meal_id, :integer
  end
end
