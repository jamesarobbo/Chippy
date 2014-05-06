class OrdersController < ApplicationController



	def new
		# this would be the checkout page

		# need everything that's in the basket to be present in the checkout page



		@order = Order.new

		basket.each do |item_id|
			@order.order_products.build(product: Product.find(item_id))
		end	

	end


	def create
		
		

		@order = Order.new(order_params)

		# @product = basket.find(params[:product_id])


		basket.each do |item_id|
			@order.order_products.build(product: Product.find(item_id))
		end

		if @order.save
			if @order.purchase(basket)
				

				render "show"
			else
				render "new"
			end
		else
			render "new"
		end

	
	
	end

	def show
		# this shows an order completed page
	end

def order_params
  params[:order][:card_expires_on] = Date.new(params[:order].delete("card_expires_on(1i)").to_i, params[:order].delete("card_expires_on(2i)").to_i , params[:order].delete("card_expires_on(3i)").to_i)
  params.require(:order).permit(:card_number, :security_code, :card_expires_on, :first_name, :last_name)
end


end
















