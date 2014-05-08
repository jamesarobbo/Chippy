class ChangeFieldInOrders < ActiveRecord::Migration
  def change
  	change_column :orders, :shipped_date, :date
  end
end
