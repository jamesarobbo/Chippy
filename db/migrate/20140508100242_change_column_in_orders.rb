class ChangeColumnInOrders < ActiveRecord::Migration
  def change
  	change_column :orders, :shipped, :boolean
  end
end
