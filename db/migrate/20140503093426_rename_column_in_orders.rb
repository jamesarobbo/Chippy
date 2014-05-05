class RenameColumnInOrders < ActiveRecord::Migration
  def change

  	rename_column :orders, :country, :country_code
  end
end
