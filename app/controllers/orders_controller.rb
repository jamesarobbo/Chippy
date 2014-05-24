class OrdersController < ApplicationController


	def new

		@order = Order.new

		# product = basket.find(:product_id)

		basket.each do |item|
			@order.order_products.build(product: Product.find(item[:product_id]), quantity: item[:quantity]) 
		end	

	end


	def create

		@order = Order.new(order_params)

		# @product = basket.find(params[:product_id])

		basket.each do |item|
			@order.order_products.build(product: Product.find(item[:product_id]), quantity: item[:quantity])
		end


		if @order.purchase(basket)
			if @order.save

				OrderNotifier.shipped(@order).deliver
			
				reset_session

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
  params[:order][:card_expires_on] = Date.new(params[:order].delete("card_expires_on(1i)").to_i, params[:order].delete("card_expires_on(2i)").to_i, params[:order].delete("card_expires_on(3i)").to_i)
  
  params.require(:order).permit(:card_number, :security_code, :card_expires_on, :first_name, :last_name, :email, :address_1, :address_2, :city, :postal_code, :country_code, :shipped, :shipped_date)
end






end
















