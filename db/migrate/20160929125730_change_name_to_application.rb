class ChangeNameToApplication < ActiveRecord::Migration[5.0]
  def change
    rename_column :applications, :restaurant_ssm_image, :restaurant_doc
  end
end
