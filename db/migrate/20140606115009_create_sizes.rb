class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
    	t.integer :product_id
    	t.integer :stock
    	t.string :size

      t.timestamps
    end
  end
end
