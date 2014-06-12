class OrderProduct < ActiveRecord::Base

  belongs_to :order
  belongs_to :product
  belongs_to :size

  after_save :call_stock_level_email_method


  def to_s
  	"#{id}"
  end


# this calls the stock_level_email method from size.rb because we want the method to trigger after order_product is saved
  def call_stock_level_email_method
    self.size.stock_level_email

  end

 

end
