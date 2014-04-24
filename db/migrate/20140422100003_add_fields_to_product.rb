class AddFieldsToProduct < ActiveRecord::Migration
  def change

  	add_column :products, :product_name, :string
  	add_column :products, :description, :string
  	add_column :products, :number_in_stock, :string
  	add_column :products, :color, :string
  	add_column :products, :size, :string
  	add_column :products, :price, :integer


  end
end
