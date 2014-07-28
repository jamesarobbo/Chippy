class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

    	t.string   :name
	    t.text     :description,        limit: 255
	    t.string   :number_in_stock
	    t.string   :color
	    t.integer  :price
	    t.integer  :order_id
	    t.string   :image_file_name
	    t.string   :image_content_type
	    t.integer  :image_file_size
	    t.datetime :image_updated_at
  

    	t.timestamps
    end
  end
end
