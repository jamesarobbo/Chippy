class RemoveSizeColumnFromProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :size
  end
end
