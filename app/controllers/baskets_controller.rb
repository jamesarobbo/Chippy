class BasketsController < ApplicationController


# need to create a unique session basket id for each person
	def create
		# get the product ID from the request sent through when 'add to cart' button clicked
		prod = Product.find(params[:product_id])

		# puts "*" *1000
		# puts basket.to_a.collect{|item| item[:product_id]}.include? prod.id

		if basket.to_a.collect{|item| item[:product_id]}.include? prod.id

			# puts "*" *1000
			# puts "I'm the first if"
		
			basket.each do |product|

				if product[:product_id] == prod.id
			
				# puts product[:quantity]	

				product[:quantity] = product[:quantity] + params[:basket][:quantity].to_i

				# puts product[:quantity]

				end
			end	 

		else     

			basket.add({product_id: prod.id, quantity: params[:basket][:quantity].to_i})

			flash[:success] = "Product added to basket"
		end

		redirect_to product_path(prod)

	end

# need to destroy the unique session basket id from the person. i.e. if they empty their basket?
	def destroy

		prod = Product.find(params[:product_id])

		if basket.to_a.collect{|item| item[:product_id]}.include? prod.id

			basket.each do |product|

				if product[:product_id] == prod.id

					basket.delete(product)
				end
			end	
		end		

		redirect_to new_order_path

	end
		# 	basket.delete({product_id: prod.id})

		# flash[:success] = "Product removed from basket"

	def update

		

	end	


		

	
end
