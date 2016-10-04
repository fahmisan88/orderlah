class AddRestaurantApplicationIdToPhoneNumber < ActiveRecord::Migration[5.0]
  def change
    add_column :phone_numbers, :restaurant_application_id, :integer

  end
end
