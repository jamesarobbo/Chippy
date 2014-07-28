ActiveAdmin.register Product do

config.batch_actions = false
menu :priority => 2

  filter :name
  filter :color
  filter :size
  filter :price

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

      row "Sizes" do |product|
          product.sizes.collect{|s| s.size}.to_sentence
      end
      # row "Current stock" do |product|
      #   product.sizes.collect{|s| s.current_stock_number}.to_sentence
      # end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Product - #{product.name}", :multipart => true do
      f.input :name
      f.input :description, :input_html => {:style => "height:100px;"}
      
      f.input :color
      
      f.input :price   
      f.input :image
      
      end
      f.actions do
        f.action :submit, :wrapper_html => {:class => "update"}
        f.cancel_link
      end  
end
end
