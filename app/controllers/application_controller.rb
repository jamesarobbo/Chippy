class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :basket
  helper_method :basket_size
  helper_method :stock_number

  def basket
    session[:basket] ||= Set.new
  end


 def basket_size

 	size = 0

 	basket.each do |t|
 		size += t[:quantity]
 	end

 	size
 end

 def stock_number(size)

 	value = size.stock - size.check_sold_quantity

 	if value < 10 

 	(1..value).to_a

 	else

 	(1..10).to_a
 	
 	end	

 end

end
