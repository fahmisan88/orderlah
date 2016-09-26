class CreateOrderedMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :ordered_meals do |t|
      t.integer :quantity
      t.integer :order_id
      t.integer :meal_id

      t.timestamps
    end
  end
end
