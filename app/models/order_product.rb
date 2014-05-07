class OrderProduct < ActiveRecord::Base

  belongs_to :order
  belongs_to :product

  def to_s
  	"#{id}"
  end

end
