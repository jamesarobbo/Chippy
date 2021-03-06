class OrderProduct < ActiveRecord::Base

  belongs_to :order
  belongs_to :product
  belongs_to :size

  after_save :call_stock_level_email_method

  validate :validate_size, :on => :create
  validate :validate_quantity, :on => :create
  validate :validate_current_stock, :on => :create
  validate :validate_product, :on => :create


# this ensures the id is a human readable format
  def to_s
  	"#{id}"
  end

  def display_name
   "Order #" + self.order.id.to_s + " - " + self.order.first_name + " " + self.order.last_name + " - " + self.product.name + " - " + self.size.to_s

  end
# this calls the stock_level_email method from size.rb because we want the method to trigger after order_product is saved
  def call_stock_level_email_method
    self.size.stock_level_email

  end


# this ensures that when the person attempts to pay the product they've selected exists. Prevents them from hacking.
  def validate_product

    unless Product.exists?(self.product_id)

      errors.add(:base, "The product you 'selected' doesn't exist. Please go back to the products page to make your selection.")
    end    

  end

# ensures that the size exists.

  def validate_size

    unless Size.exists?(self.size_id)

      errors.add(:base, "The size you 'selected' doesn't exist. Please select a size from the drop down menu on the individual product page.")
    
    end 

  end

# ensures that the person doesn't order more than 10 od each product and size.
  def validate_quantity

    unless self.quantity <= 10

      errors.add(:base, "Unfortunately, you can't order more than 10 of each item and size at a time. Please reduce the number of items in your basket before proceeding.")
    end  

  end

# ensures that there is actually enough stock available. 
  def validate_current_stock

    unless self.quantity <= self.size.current_stock_number

      errors.add(:base, "Unfortunately, there's only #{self.size.current_stock_number} of that item, #{self.product.name} - #{self.size}, left in stock. Please edit your basket.")

    end
  end  

 

end
