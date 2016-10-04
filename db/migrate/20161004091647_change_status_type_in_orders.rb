class ChangeStatusTypeInOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :status
    add_column :orders, :status, :integer
  end
end
