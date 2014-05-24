class BasketsController < ApplicationController

	def create
	
		prod = Product.find(params[:product_id])

		if basket.to_a.collect{|item| item[:product_id]}.include? prod.id

			basket.each do |product|

				if product[:product_id] == prod.id

				product[:quantity] = product[:quantity] + params[:basket][:quantity].to_i

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

    def basket_update

        prod = Product.find_by(name: params[:name])

        if basket.to_a.collect{|item| item[:product_id]}.include? prod.id 

            basket.each do |product|

                if product[:product_id] == prod.id

                product[:quantity] = params[:quantity].to_i  

                end
            end
        end   

        respond_to do |format|

            format.js 

        end          

    end    

	


		

	
end
