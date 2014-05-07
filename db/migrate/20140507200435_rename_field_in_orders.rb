class RenameFieldInOrders < ActiveRecord::Migration
  def change
  	rename_column :orders, :status, :shipped
  end
end
