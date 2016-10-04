class AddApplicationStatusToRestaurantApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurant_applications, :application_status, :boolean
  end
end
