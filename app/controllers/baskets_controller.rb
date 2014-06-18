class BasketsController < ApplicationController

	def create
	
		prod = Product.find(params[:product_id])


		if Product.exists?(params[:product_id].to_i)

			if basket.to_a.collect{|item| [item[:product_id], item[:size]]}.include? [prod.id, params[:basket][:size]]

					basket.each do |product| 

						if product[:product_id] == prod.id && product[:size] == params[:basket][:size] 

								product[:quantity] = params[:basket][:quantity].to_i

		                		flash.now[:success] = "Added to basket"

						end
					end	


			else     

			
			basket.add({product_id: prod.id, quantity: params[:basket][:quantity].to_i, size: params[:basket][:size]})

			flash.now[:success] = "Added to basket"


			end

		else
		
		reset_session

		end	

		respond_to do |format|

            format.js
        end    

	end


	def destroy

		prod = Product.find(params[:product_id])

		@size = params[:size]

		if basket.to_a.collect{|item| [item[:product_id], item[:size]]}.include? [prod.id, @size]

			basket.each do |product|

				if product[:product_id] == prod.id && product[:size] == @size

					basket.delete(product)

                flash.now[:remove] = "Item removed from basket"
                    
				end
			end	
		end		

		respond_to do |format|

            format.js

        end    

	end


    def basket_update

        prod = Product.find_by(name: params[:name])

        if basket.to_a.collect{|item| item[:product_id]}.include? prod.id 

            basket.each do |product|

                if product[:product_id] == prod.id && Size.find(product[:size]).size == params[:size]

                product[:quantity] = params[:quantity].to_i 

                flash.now[:update] = "Basket has been updated" 

                end
            end
        end   

        respond_to do |format|

            format.js 

        end          

    end    

	


		

	
end
