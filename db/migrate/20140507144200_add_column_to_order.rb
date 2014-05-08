class AddColumnToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :status, :string
  	add_column :orders, :shipped_date, :datetime
  	remove_column :orders, :product_id
  end
end
