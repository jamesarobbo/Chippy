class AddCancelColumnToOrders < ActiveRecord::Migration
  def change

  	add_column :orders, :cancel, :boolean, :default => false
  	add_column :orders, :cancel_date, :date
  end
end
