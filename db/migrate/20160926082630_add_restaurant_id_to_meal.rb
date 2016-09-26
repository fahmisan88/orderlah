class AddRestaurantIdToMeal < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :restaurant_id, :integer
  end
end
