class OrderProduct < ActiveRecord::Base

  belongs_to :order
  belongs_to :product
  belongs_to :size

  after_save :call_stock_level_email_method

  validate :validate_size, :on => :create
  validate :validate_quantity, :on => :create
  validate :validate_current_stock, :on => :create
  validate :validate_product, :on => :create

  def to_s
  	"#{id}"
  end

# this calls the stock_level_email method from size.rb because we want the method to trigger after order_product is saved
  def call_stock_level_email_method
    self.size.stock_level_email

  end

  def validate_product

    unless Product.exists?(self.product_id)

      errors.add(:base, "The product you 'selected' doesn't exist. Please go back to the products page to make your selection.")
    end    

  end

  def validate_size

    unless Size.exists?(self.size_id)

      errors.add(:base, "The size you 'selected' doesn't exist. Please select a size from the drop down menu on the individual product page.")
    
    end 

  end

  def validate_quantity

    unless self.quantity <= 10

      errors.add(:base, "Unfortunately, you can't order more than 10 of each item and size at a time. Please reduce the number of items in your basket before proceeding.")
    end  

  end

  def validate_current_stock

    unless self.quantity <= self.size.current_stock_number

      errors.add(:base, "Unfortunately, there's only #{self.size.current_stock_number} of that item, #{self.product.name} - #{self.size}, left in stock. Please edit your basket.")

    end
  end  

 

end
