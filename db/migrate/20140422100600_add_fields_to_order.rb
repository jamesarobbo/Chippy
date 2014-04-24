class AddFieldsToOrder < ActiveRecord::Migration
  def change

  	add_column :orders, :first_name, :string
  	add_column :orders, :last_name, :string
  	add_column :orders, :email, :string
  	add_column :orders, :address_1, :string
  	add_column :orders, :address_2, :string
  	add_column :orders, :city, :string
  	add_column :orders, :postal_code, :string
  	add_column :orders, :country, :string
  	add_column :orders, :product_id, :integer

  end
end
