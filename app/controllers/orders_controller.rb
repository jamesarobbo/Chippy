class OrdersController < ApplicationController


	def new



		puts @order = Order.new



		basket.each do |item|
			@order_product = @order.order_products.build(product: Product.find(item[:product_id]), quantity: item[:quantity], size: Size.find(item[:size]))
			
		end	




	end


	def create

		@order = Order.new(order_params)

		# @product = basket.find(params[:product_id])

		

		basket.each do |item|
			@order_product = @order.order_products.build(product: Product.find(item[:product_id]), quantity: item[:quantity], size: Size.find(item[:size]))
		end


		if @order.purchase(basket) && @order.save

				OrderNotifier.shipped(@order).deliver
			
				reset_session

				render "show"

		
		else
				render "new"
			
		end

	end

	def show
		# this shows an order completed page
	end

def order_params
  params[:order][:card_expires_on] = Date.new(params[:order].delete("card_expires_on(1i)").to_i, params[:order].delete("card_expires_on(2i)").to_i, params[:order].delete("card_expires_on(3i)").to_i)
  
  params.require(:order).permit(:card_number, :security_code, :card_expires_on, :first_name, :last_name, :email, :address_1, :address_2, :city, :postal_code, :country_code)
end






end
















