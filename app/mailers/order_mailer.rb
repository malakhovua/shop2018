class OrderMailer < ApplicationMailer
default from: 'Sam Ruby malakhovua@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received(order)
    @order = order
    mail to: order.e_mail, subject: 'Shop 2018 Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped(order)
    @order = order

    mail to: order.e_mail, subject: 'Shop 2018 Order Shipped'
  end
end
