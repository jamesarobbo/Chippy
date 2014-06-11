class ProductsController < ApplicationController


	def index
		# show all of the products

		@products = Product.all

	end

	def show
		# show an individual product on a new page. 

		@product = Product.find(params[:id])

	end

	def available_stock

		var = Size.find(params[:size])

		@stocks = stock_number(var)

		respond_to do |format|

            format.js
        end  

	end	


	





end
