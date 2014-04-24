class ProductsController < ApplicationController


	def index 
		# show all of the products 

		@product = Product.all


	end

	def show
		# show an individual product on a new page. not necessary if i use a lightbox of some sort.


	end


end
