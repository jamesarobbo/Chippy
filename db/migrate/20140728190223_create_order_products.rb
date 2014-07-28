class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|

    	t.integer  :quantity
    	t.integer  :size_id
    	t.integer  :order_id
    	t.integer  :product_id
    	
    	
    	t.timestamps
    end
  end
end
