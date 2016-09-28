class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.string :restaurant_name
      t.string :restaurant_ssm_image
      t.string :phone

      t.timestamps
    end
  end
end
