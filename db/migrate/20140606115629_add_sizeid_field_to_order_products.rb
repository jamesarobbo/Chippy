class AddSizeidFieldToOrderProducts < ActiveRecord::Migration
  def change
  	add_column :order_products, :size_id, :integer
  	remove_column :order_products, :size
  	remove_column :order_products, :price
  end
end
