class AddStatusToApplication < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :status, :boolean
  end
end
