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
  

end
  

