class AddEtaToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :eta, :datetime
  end
end
