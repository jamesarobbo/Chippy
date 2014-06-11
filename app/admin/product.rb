ActiveAdmin.register Product do

menu :priority => 2

  filter :name
  filter :color
  filter :size
  filter :price
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end



  index do
    selectable_column
    column "Product ID", :id
    column :name
    column :description
    column "Price", :sortable => :price do |product| 
      number_to_currency product.price
    end  
    column :color
    
    column :image_file_name  

    default_actions
  end


  show do
    attributes_table do
        row :id
        row :name
        row :description
        row :color
        row :price do |product|
          number_to_currency product.price
        end  
        row :image_file_name
        row :updated_at
              
    end
    
    active_admin_comments
  end

  sidebar :Product_Stats, :only => :show do

    attributes_table_for product do
      row "Total sold" do
        product.total_sold_product
      end  

    end
  end


  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Product", :multipart => true do
      f.input :name
      f.input :description
      
      f.input :color
      
      f.input :price   
      f.input :image
      
      end
      f.actions
end
end
