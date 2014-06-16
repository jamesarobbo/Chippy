class OrderProduct < ActiveRecord::Base

  belongs_to :order
  belongs_to :product
  belongs_to :size

  after_save :call_stock_level_email_method

  validate :validate_size, :on => :create
  validate :validate_quantity, :on => :create


  def to_s
  	"#{id}"
  end


# this calls the stock_level_email method from size.rb because we want the method to trigger after order_product is saved
  def call_stock_level_email_method
    self.size.stock_level_email

  end

  def validate_size

    unless Size.exists?(self.size_id)

      errors.add(:base, "The size you 'selected' doesn't exist. Please select a size from the drop down menu on the individual product page.")
    
    end 

  end

  def validate_quantity

    puts "*" *1000
    puts self.quantity

    unless self.quantity <= 10

      puts errors.add(:base, "Unfortunately, you can't order more than 10 of each item and size at a time. Please reduce the number of items in your basket before proceeding.")
    end  

  end

 

end
