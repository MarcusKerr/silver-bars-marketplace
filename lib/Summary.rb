# frozen_string_literal: true

class Summary
  NO_ORDERS_MESSAGE = 'No orders to display'

  def self.display(orders)
    print "LIVE ORDERS\n\n"
    display_orders(orders[:buys], orders[:sells])
  end

  def self.display_orders(buy_orders, sell_orders)
    print "BUY:\n"
    format_order_display(buy_orders)
    print "\nSELL:\n"
    format_order_display(sell_orders)
  end

  def self.format_order_display(orders)
    orders.empty? ? print("#{NO_ORDERS_MESSAGE}\n") : print_orders(orders)
  end

  def self.print_orders(orders)
    prefix = orders[0].type == :BUY ? 'b' : 's'
    sorted_orders = sort_orders(orders)
    sorted_orders.each do |order|
      printf("%s%s. %10s\n", ((orders.index(order) + 1)).to_s, prefix, format_order_details(order))
    end
  end

  def self.format_order_details(order)
    "#{order.quantity}kg for £#{order.price_per_kg}"
  end

  def self.sort_orders(orders)
    sorted_orders = orders.sort_by &:price_per_kg
    orders[0].type == :BUY ? sorted_orders.reverse : sorted_orders
  end

  private_class_method  :display_orders,
                        :format_order_display,
                        :print_orders,
                        :format_order_details,
                        :sort_orders
end
