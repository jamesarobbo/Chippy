class Product < ActiveRecord::Base

	has_many :order_products
	has_many :orders, through: :order_products
  has_many :sizes


	has_attached_file :image, styles: {large: "480x480#", medium: "240x240#", small: "120x120#"}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def in_stock
    self.sizes.where('stock > 0')
  end

# this calculates the total number of each product, regardless of size, that has been sold
  def total_sold_product
      self.order_products.collect{|item| item[:quantity]}.sum

  end

# this calculates the total value of sold products, regardless of size
  def total_sold_product_value

      self.price * self.order_products.collect{|item| item[:quantity]}.sum 

  end

  # def check_sold_quantity

    

  #     self.order_products.joins(:order).where(orders: {cancel: false})collect{item[:quantity]}.sum

    

  # end




  def self.total_basket_price(basket)
    # where(id: basket.to_a.collect{|item| item[:product_id]}).sum(:price)
    prods = where(id: basket.to_a.collect{|item| item[:product_id]}).collect{|product| [:id => product.id, :price => product.price]}

    price_list = []

    prods.each do |prod|
      price_list << Hash[*prod]
    end  

    # price_list = Hash[*price_list]

    grand_sum = 0

    basket.each do |item|

      # puts "basket"

      # puts grand_sum

      sum = 0

      # puts "sum: #{sum}" 
      
      price_list.each do |listing|

        # puts "price_list"

        # puts "sum: #{sum}"

        # puts price_list

        # puts "listing id #{listing[:id]}"
        # puts "basket product id #{item[:product_id]}"

        if item[:product_id] == listing[:id]
          sum = item[:quantity] * listing[:price]

          # puts "sum on matching #{sum}"

          grand_sum += sum
        end
      # puts "grand sum"

      # puts "#{grand_sum} + grand_sum"

      # puts sum
         
      end   

    end

    grand_sum

  end

 

 


  
  # def self.product(basket)
  # 	a = Product.find(basket.to_a).collect{|product| product.name + " " + product.size + " " + product.color}
  # 	b = a.join(', ')
  # end

 	



end
