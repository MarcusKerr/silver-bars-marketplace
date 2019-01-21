# frozen_string_literal: true

class Summary
  NO_ORDERS_MESSAGE = 'No orders to display'

  def self.display(orders)
    print "LIVE ORDERS\n\n"
    display_orders(orders.buys, orders.sells)
  end

  def self.display_orders(buy_orders, sell_orders)
    print "BUY:\n"
    format_order_display(buy_orders)
    print "\nSELL:\n"
    format_order_display(sell_orders)
  end

  def self.format_order_display(orders)
    orders.empty? ? print("#{NO_ORDERS_MESSAGE}\n") : merge_orders(orders)
  end

  def self.merge_orders(orders_arr)
    grouped_orders = group_orders(orders_arr)
    merged_orders = []
    grouped_orders.each do |grouped_orders_arr|
      quantity = 0
      order_ids = []
      price_per_kg = grouped_orders_arr[0].price_per_kg
      grouped_orders_arr.each do |order|
        quantity += order.quantity
        order_ids << orders_arr.index(order)
      end
      merged_orders << { ids: order_ids, quantity: quantity, price_per_kg: price_per_kg }
    end
  end

  def self.group_orders(orders_arr)
    grouped_orders = []
    orders_arr.each do |order|
      grouped_orders << orders_arr.select { |this_order| this_order.price_per_kg == order.price_per_kg }
    end
    grouped_orders.uniq
  end

  def self.print_orders(orders_arr)
    prefix = buy?(orders_arr[0]) ? 'b' : 's'
    sorted_orders = sort_orders(orders_arr)
    sorted_orders.each do |order|
      order_id = "#{orders_arr.index(order) + 1}#{prefix}"
      puts "#{format_order_details(order)} // order #{order_id}"
    end
  end

  def self.format_order_details(order)
    "#{order.quantity}kg for £#{order.price_per_kg}"
  end

  def self.sort_orders(orders)
    sorted_orders = orders.sort_by &:price_per_kg
    buy?(orders[0]) ? sorted_orders.reverse : sorted_orders
  end

  def self.buy?(index_order)
    index_order.type == :BUY
  end

  private_class_method  :display_orders,
                        :format_order_display,
                        :print_orders,
                        :format_order_details,
                        :sort_orders,
                        :buy?
end
