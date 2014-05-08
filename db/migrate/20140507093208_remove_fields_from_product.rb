class RemoveFieldsFromProduct < ActiveRecord::Migration
  def change

  	remove_column :orders, :product_name
  	remove_column :orders, :product_price
  	remove_column :orders, :product_color
  	remove_column :orders, :product_size

  end
end
