class AddMoreFieldsOrders < ActiveRecord::Migration
  def change

  	add_column :orders, :product_name, :string
  	add_column :orders, :product_price, :integer
  	add_column :orders, :product_color, :string
  	add_column :orders, :product_size, :string
  	
  end
end
