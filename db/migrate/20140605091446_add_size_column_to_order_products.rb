class AddSizeColumnToOrderProducts < ActiveRecord::Migration
  def change

  	add_column :order_products, :size, :string
  	
  end
end
