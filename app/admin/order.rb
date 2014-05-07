ActiveAdmin.register Order do

filter :created_at 
filter :order_products
filter :products
filter :last_name
filter :email
filter :country_code
filter :shipped
filter :shipped_date

scope :all, :default => true
scope :shipped
scope :pending
  
  
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
    column "Order ID", :id
    column "Order Date", :created_at
    
    column "Status", :sortable => :shipped do |s|
      status_tag((s.shipped? ? "Shipped" : "Pending"), (s.shipped? ? :ok : :warning))
    end
    column :shipped_date
    column ("Total") {number_to_currency Product.total_basket_price(basket) }
    column :first_name
    column :last_name
    column :email
    column :address_1
    column :address_2
    column :city
    column :postal_code
    column "Country", :country_code
    
    default_actions
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
      f.input :shipped_date
      f.input :shipped
      

      
      end
      f.actions
end
  




end

