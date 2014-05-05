class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :basket
  helper_method :total_price
  helper_method :price_in_cents
  
  def basket
    session[:basket] ||= Set.new
  end

  def total_price

  	@total = Product.where(id: basket.to_a).sum(:price)
  	# product = Product.find(session[:basket].to_a).collect{|product| product.price}

  	# product.sum
  	# return product.inspect
  

  	# return session[:basket]
  	
  end


  def price_in_cents

	(total_price*100).round

  end

  



end
