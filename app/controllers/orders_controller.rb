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
		# this adds the order to the database


	end

	def show
		# this shows an order completed page
	end




end
