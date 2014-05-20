class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :basket
  helper_method :basket_size

  
  def basket
    session[:basket] ||= Set.new
  end

 # include ApplicationHelper


  def basket_size

 	size = 0

 	basket.each do |t|
 		size += t[:quantity]
 	end

 	size

 end

 def self.number_of_each
      
    
    
    

 end






end
