class RenameImageNameToRestaurant < ActiveRecord::Migration[5.0]
  def change
    rename_column :restaurants, :image, :profile_image
    add_column :restaurants, :banner_image, :string

  end
end
