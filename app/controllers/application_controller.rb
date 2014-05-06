class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :basket

  
  def basket
    session[:basket] ||= Set.new
  end

 # include ApplicationHelper





  



end
