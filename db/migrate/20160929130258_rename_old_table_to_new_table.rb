class RenameOldTableToNewTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :applications, :restaurant_application
  end
end
