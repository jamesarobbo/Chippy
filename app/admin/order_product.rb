ActiveAdmin.register OrderProduct do
  
menu false
menu :priority => 4

actions :all, :except => :new

controller do
  def destroy
    destroy! do |format|
    format.html {redirect_to :back}
    end
  end


  def update

    order = OrderProduct.find(params[:id]).order

    super do |success,failure|
      success.html {redirect_to admin_order_path(order)}
    end  
  end


end 
  
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




end
  

