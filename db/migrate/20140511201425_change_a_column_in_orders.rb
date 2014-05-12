class ChangeAColumnInOrders < ActiveRecord::Migration
  def change

  	remove_column :orders, :shipped

  	add_column :orders, :status, :boolean, default: false
  	 
  end
end
