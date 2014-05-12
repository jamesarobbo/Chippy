ActiveAdmin.register Order do

menu :priority => 1

scope :all
scope :pending, :default => true
scope :shipped

filter :created_at, :label => "Order Date"
# filter :order_products
filter :products
filter :last_name
filter :email, :label => "Email Address"
filter :country_code, :label => "Country"
filter :shipped
filter :shipped_date

actions :all, :except => :new


  index do 
    selectable_column
    column "Order ID", :sortable => :id do |order| 
      link_to "##{order.id}", admin_order_path(order)
    end 
    column "Order Date", :created_at
    # column link_to("Products", admin_order_products_path(:products_id))
    column "Status", :sortable => :shipped do |ship|
      status_tag((ship.shipped? ? "Shipped" : "Pending"), (ship.shipped? ? :ok : :warning))
    end
    column :shipped_date
    column :first_name
    column :last_name
    column "Email Address", :email
    column :address_1
    column :address_2
    column :city
    column :postal_code
    column "Country", :country_code
    
    default_actions
   end 


  show do
    panel "Invoice" do
      table_for(order.order_products) do |t|
        t.column("Product ID") {|item| item.product.id}
        t.column("Product") {|item| auto_link item.product}
        t.column("Description") {|item| item.product.description}
        t.column("Color") {|item| item.product.color}
        t.column("Size") {|item| item.product.size}
        # t.column("Quantity") {|item| item.quantity}
        t.column("Price") {|item| number_to_currency item.product.price}

      end
      
    end
    active_admin_comments
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
      f.input :shipped_date, start_year: Date.today.year
      
      end
      f.actions
end
  




end

