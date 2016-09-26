class AddDineInToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :dine_in, :boolean
  end
end
