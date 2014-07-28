class ChangeColumnInOrders < ActiveRecord::Migration
  def change
  	change_column :orders, :shipped, 'boolean USING CAST(shipped AS boolean)'
  end
end
