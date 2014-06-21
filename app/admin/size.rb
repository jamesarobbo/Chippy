

ActiveAdmin.register Size do

menu :priority => 3


  index do
      selectable_column
      column "Size ID" do |size|
        link_to size.id, admin_size_path(size)
      end  
      column :product
      column :size
      column "Initial stock", :stock
      column "Current stock", sortable: :current_stock_number do |s|
        s.current_stock_number
      end
      column "Total sold", sortable: :check_sold_quantity do |s|
        s.check_sold_quantity
      end  

      default_actions
  end


  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Size", :multipart => true do
      f.input :product
      f.input :size
      f.input :stock

      end
      f.actions
  end

  
end
