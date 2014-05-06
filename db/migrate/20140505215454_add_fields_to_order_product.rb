class AddFieldsToOrderProduct < ActiveRecord::Migration
  def change
  	add_column :order_products, :product_name, :string
  end
end
