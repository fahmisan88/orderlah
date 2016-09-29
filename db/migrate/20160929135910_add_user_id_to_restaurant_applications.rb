class AddUserIdToRestaurantApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurant_applications, :user_id, :integer
  end
end
