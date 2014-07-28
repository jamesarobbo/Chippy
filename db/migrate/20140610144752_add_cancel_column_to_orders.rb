class AddCancelColumnToOrders < ActiveRecord::Migration
  def change

  	add_column :orders, :cancel, 'boolean USING CAST(cancel AS boolean)', :default => false
  	add_column :orders, :cancel_date, :date
  end
end
