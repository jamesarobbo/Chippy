class BasketsController < ApplicationController


# need to create a unique session basket id for each person
	def create


		# get the product ID from the request sent through when 'add to cart' button clicked
		product = Product.find(params[:product_id])

		basket.add(product.id)

		flash[:success] = "Product added to basket"

		redirect_to product_path(product)

	end

# need to destroy the unique session basket id from the person. i.e. if they empty their basket?
	def destroy
		product = Product.find(params[:product_id])

		basket.delete(product.id)

		flash[:success] = "Product removed from basket"


		# redirect to the products index page
		redirect_to new_order_path

	end
end
