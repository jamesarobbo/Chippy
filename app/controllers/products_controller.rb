class ProductsController < ApplicationController


	def index
		# show all of the products

		@products = Product.all


	end

	def show
		# show an individual product on a new page. 

		@product = Product.find(params[:id])

		

	end

	





end
