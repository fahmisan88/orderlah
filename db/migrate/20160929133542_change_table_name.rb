class ChangeTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :restaurant_application, :restaurant_applications
  end
end
