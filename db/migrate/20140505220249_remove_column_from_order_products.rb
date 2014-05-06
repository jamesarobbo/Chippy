class RemoveColumnFromOrderProducts < ActiveRecord::Migration
  def change
  	remove_column :order_products, :product_name
  end
end
