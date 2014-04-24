class BasketsController < ApplicationController


# need to create a unique session basket id for each person
	def create


		# get the product ID from the request sent through when 'add to cart' button clicked
		product = Product.find(params[:product_id])
		 
		@basket = 
		 

		session[:basket_id] = @basket


	end

# need to destroy the unique session basket id from the person. i.e. if they empty their basket?
	def destroy

		reset_session

		# redirect to the products index page
		redirect_to products_path
		
	end
end
