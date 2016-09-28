class AddImageToMeal < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :image, :string
  end
end
