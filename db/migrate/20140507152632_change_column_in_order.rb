class ChangeColumnInOrder < ActiveRecord::Migration
  def change
  	change_column :orders, :status, :boolean
  end
end
