class AddDefaultValueToShowAttribute < ActiveRecord::Migration[5.0]
  def change
    change_column :restaurant_applications, :application_status, :boolean, :default => false
  end
end
