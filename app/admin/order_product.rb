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

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Edit Quantity", :multipart => true do
     
        opsizes = OrderProduct.find(params[:id]).product.sizes
        
        f.input :size, as: :select, collection: opsizes
        f.input :quantity
      end
      f.actions do
        order = OrderProduct.find(params[:id]).order
        f.action(:submit)
        f.cancel_link(admin_order_path(order))
      end
  end
  

end
  

