class OrderProduct < ActiveRecord::Base

  belongs_to :order
  belongs_to :product
  belongs_to :size


  def to_s
  	"#{id}"
  end

 

    # def self.product(basket)
  	# a = Product.find(basket.to_a).collect{|product| product.id}
  	

	  # end
end
