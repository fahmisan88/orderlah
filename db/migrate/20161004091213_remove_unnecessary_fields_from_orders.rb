class RemoveUnnecessaryFieldsFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :restaurant_id
    remove_column :orders, :meal_id
    remove_column :orders, :quantity
  end
end
