class AddLatitudeAndLongitudeToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :latitude, :float
    add_column :restaurants, :longitude, :float
    add_column :restaurants, :full_address, :string
  end
end
