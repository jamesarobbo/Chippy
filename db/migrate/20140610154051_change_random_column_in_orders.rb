class ChangeRandomColumnInOrders < ActiveRecord::Migration
  def change
  	change_column :orders, :random, :string, :default => "Pending"
  end
end
