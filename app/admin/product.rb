ActiveAdmin.register Product do

  
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
