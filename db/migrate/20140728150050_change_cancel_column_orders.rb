class ChangeCancelColumnOrders < ActiveRecord::Migration
  def change
  	change_column :orders, :cancel, 'boolean USING CAST(cancel AS boolean)'
  end
end
