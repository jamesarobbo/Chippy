ActiveAdmin.register Order do

menu :priority => 1

scope :all
scope :pending, :default => true
scope :shipped
# scope :complete
# scope :cancelled

filter :created_at, :label => "Order Date"
# filter :order_products
filter :products
filter :last_name
filter :email, :label => "Email Address"
filter :shipped
filter :shipped_date
filter :cancel, :label => "Cancelled"
filter :cancel_date
 

actions :all, :except => :new 

  index do 
    selectable_column
    column "Order ID", :sortable => :id do |order| 
      link_to "##{order.id}", admin_order_path(order)
    end 
    column "Order Date", :created_at

    column "Purchase Status", :sortable => :cancel do |c|
      status_tag((c.cancel? ? "Cancelled" : "Complete"), (c.cancel? ? :error : :ok))
    end
   
    column "Shipment Status", :sortable => :shipped do |ship|
      status_tag((ship.shipped? ? "Shipped" : "Pending"), (ship.shipped? :warning))
    end
    column :first_name
    column :last_name
    column "Email Address", :email
    
    default_actions
   end 


  show do
    panel "Invoice" do
      table_for(order.order_products) do |t|
        
        t.column("Product") {|item| auto_link item.product}
        
        t.column("Color") {|item| item.product.color}
        t.column("Size") {|item| item.size}
        t.column("Quantity") {|item| item.quantity}
        t.column("Cost") {|item| number_to_currency item.product.price * item.quantity}


        t.column "" do |item|
          link_to "View", admin_order_product_path(item)
        end
        t.column "" do |item|
          link_to "Edit", edit_admin_order_product_path(item)
        end
        t.column "" do |item|
          link_to "Delete", admin_order_product_path(item), :method => :delete, :confirm => "Are you sure you want to delete this?" 

        end


      end
      

    end
    active_admin_comments
  end 


  sidebar :Customer_Information, :only => :show do

    attributes_table_for order do
      row :first_name
      row :last_name
      row :email
    end
  end

  sidebar :Shipping_Information, :only => :show do

    attributes_table_for order do

      row "Purchase Status" do |c|
        status_tag((c.cancel? ? "Cancelled" : "Complete"), (c.cancel? ? :error : :ok))
      end

      row "Shipment Status" do |ship|
        status_tag((ship.shipped? ? "Shipped" : "Pending"), (ship.shipped? :warning))
      end

      row "Address" do |t|
        t.address_1
      end  
      row "Addr. 2" do |t|
       t.address_2
      end  
      row :city
      row :postal_code
      row "Country" do |t|
        t.country_code
      end  
    end
  end   

 
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Order", :multipart => true do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :address_1
      f.input :address_2
      f.input :city   
      f.input :postal_code
      f.input :country_code
      f.input :shipped
      f.input :shipped_date, start_year: Date.today.year, order: [:day, :month, :year]

      f.input :cancel
      f.input :cancel_date, start_year: Date.today.year, order: [:day, :month, :year]

      
      
      end
      f.actions
  end
  




end

