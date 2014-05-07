ActiveAdmin.register Product do

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
    column "Product ID", :id
    column :name
    column :description
    column :price
    column :color
    column :size
    column :image_file_name  
  end


  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Product", :multipart => true do
      f.input :name
      f.input :description
      f.input :number_in_stock
      f.input :color
      f.input :size
      f.input :price   
      f.input :image
      
      end
      f.actions
end
end
