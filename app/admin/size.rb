ActiveAdmin.register Size do

menu :priority => 3

  index do
      selectable_column
      column "Size ID" do |size|
        link_to size.id, admin_size_path(size)
      end  
      column :product 
      column :size
      column "Current stock", sortable: :current_stock_number do |s|
        s.current_stock_number
      end

      actions
  end


  show do 
    attributes_table do

      row :id
      row :product
      row :size
      row :updated_at
      row :created_at
      
    end
    active_admin_comments
  end  

    

  sidebar :Size_stats, :only => :show do

    attributes_table_for size do
      row "Current stock", sortable: :current_stock_number do |s|
        s.current_stock_number
      end
      row "Total sold", sortable: :check_sold_quantity do |s|
        s.check_sold_quantity
      end
      row "Total value", sortable: :total_sold_size_value do |s|
        number_to_currency s.total_sold_size_value
      end

    end  

  end 


  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs :multipart => true do
      if f.object.new_record?
        f.input :product, :wrapper_html => {:class => "enabled"}
      end
     
      f.input :product, :input_html => {:disabled => true}, :wrapper_html => {:class => "disabled", :id => "disabled"}
      f.input :size, as: :select, collection: ["One Size", "X-Small", "Small", "Medium", "Large", "X-Large"]
      f.input :stock, :input_html => {:style => "width: 40px;"}
    
      end
      f.actions do
        f.action :submit, :wrapper_html => {:class => "update"}
        f.cancel_link
      end
  end

  
end
