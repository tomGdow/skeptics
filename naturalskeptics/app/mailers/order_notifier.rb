class OrderNotifier < ActionMailer::Base
  default from: 'Natural Skeptics <thomasgdowling@gmail.com>'

  def received(order)
    @order = order
    mail to: order.email, subject: 'Natural Skeptics Order Confirmation'
  end

=begin
  def shipped(order)
    @order = order
    mail to: order.email, subject: 'Natural Skeptics Order Shipped'
  end
=end

end
