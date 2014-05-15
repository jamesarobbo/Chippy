class OrderNotifier < ActionMailer::Base
  default from: "Chippy WorldWide Racing"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received()
    

    

  
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
   
    mail(to: order.email, subject: "Your Chippy order has been placed! - Order ref: #{order.id}")

  end
end
