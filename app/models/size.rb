class Size < ActiveRecord::Base

belongs_to :product
has_many :order_products


def display_name
	a = self.id.to_s
	b = self.size 
end

def to_s
  	"#{size}"
end


# this collects and sums the quantity of each order product if the order cancel field is false
def check_sold_quantity

	self.order_products.joins(:order).where(orders: {cancel: false}).collect{|item| item[:quantity]}.sum

end

# this is for the current_stock column in the active admin size model view
def current_stock_number

    var = self.order_products.joins(:order).where(orders: {cancel: false}).collect{|item| item[:quantity]}.sum

    level = self.stock - var
     
end



def stock_level_email

	var = self.order_products.joins(:order).where(orders: {cancel: false}).collect{|item| item[:quantity]}.sum

    @level = self.stock - var

    if @level = 5

    	StockNotifier.stock_level(self).deliver
    else
    
    end	


end







def self.hello

	self.count

end


def hello

	puts "ciao"

end







end
