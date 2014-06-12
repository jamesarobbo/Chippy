class StockNotifier < ActionMailer::Base
  default from: "Chippy WorldWide Racing"
  

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.stock_notifier.stock_level.subject
  #


  def stock_level(stock)

    @stock = stock
    
    mail to: "jamesarobinson6@gmail.com", subject: "*** STOCK LEVEL LOW ***"

  end
end
