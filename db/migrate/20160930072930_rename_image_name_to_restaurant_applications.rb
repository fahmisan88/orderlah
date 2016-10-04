class RenameImageNameToRestaurantApplications < ActiveRecord::Migration[5.0]
  def change
    rename_column :restaurant_applications, :phone, :phone_number
    rename_column :restaurant_applications, :status, :verified
    add_column :restaurant_applications, :pin, :string

  end
end
