class Notifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order)
    @order=order
    attachments["living-book.png"] = File.read("#{Rails.root}/app/assets/images/logo-attach.png")

    mail(to: "#{order.name} < #{order.email} >", subject: "Alexandria Links Order Confirmation")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped
    @greeting = "Hi"

    mail to: "to@example.org"
  end

end
