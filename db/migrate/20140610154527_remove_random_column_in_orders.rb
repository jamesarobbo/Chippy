class RemoveRandomColumnInOrders < ActiveRecord::Migration
  def change
  	remove_column :orders, :random
  end
end
