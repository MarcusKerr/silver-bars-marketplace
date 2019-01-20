# frozen_string_literal: true

class Summary
  def self.display(orders)
    print "LIVE ORDERS\n\n"
    display_orders(orders[:buys], orders[:sells])
  end

  def self.display_orders(buy_orders, sell_orders)
    print "BUY:\n"
    format_orders(buy_orders)
    print "\nSELL:\n"
    format_orders(sell_orders)
  end

  def self.format_orders(orders)
    prefix = orders[0].type == :BUY ? 'b' : 's'
    orders.each do |order|
      printf("%s%s. %10s\n", ((orders.index(order) + 1)).to_s, prefix, format_order_details(order))
    end
  end

  def self.format_order_details(order)
    "#{order.quantity}kg for £#{order.price_per_kg}"
  end

  private_class_method :display_orders, :format_orders, :format_order_details
end
