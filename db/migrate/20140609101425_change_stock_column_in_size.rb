class ChangeStockColumnInSize < ActiveRecord::Migration
  def change

  	change_column :sizes, :stock, :integer, :default => 0
  end
end
