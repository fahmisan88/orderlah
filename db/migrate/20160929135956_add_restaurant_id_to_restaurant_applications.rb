class AddRestaurantIdToRestaurantApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :restaurant_application_id, :integer
  end
end
