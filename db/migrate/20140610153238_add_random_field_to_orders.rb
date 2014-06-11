class AddRandomFieldToOrders < ActiveRecord::Migration
  def change

  	add_column :orders, :random, :string
  end
end
