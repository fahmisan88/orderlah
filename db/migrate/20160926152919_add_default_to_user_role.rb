class AddDefaultToUserRole < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :role, :integer, default: 0
  end
end
