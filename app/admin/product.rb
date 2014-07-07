ActiveAdmin.register Product do

config.batch_actions = false
menu :priority => 2

  filter :name
  filter :color
  filter :size
  filter :price
  
  # index do
  #   selectable_column
  #   column "Product ID", :id
  #   column :name
  #   column "Price", :sortable => :price do |product| 
  #     number_to_currency product.price
  #   end  
  #   column :color
  #   column "Total Sold", sortable: :total_sold_product do |product|
  #     product.total_sold_product
  #   end 
    
  #   default_actions
  # end

  index :as => :grid do |product|
    div do
      a :href => admin_product_path(product) do
        image_tag product.image(:small)
      end
    end
    a truncate(product.name), :href => admin_product_path(product)
    
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
        row :created_at
        row :updated_at
        row "Sizes" do |product|
          product.sizes.collect{|s| s.size}.to_sentence
        end
              
    end
    
    active_admin_comments
  end

  sidebar :Product_Stats, :only => :show do

    attributes_table_for product do
      row "Total sold" do
        product.total_sold_product
      end  
      row "Total value" do
        number_to_currency product.total_sold_product_value
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
