# frozen_string_literal: true

require_relative 'MergedOrder'

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

  def self.format_order_display(orders_arr)
    orders_arr.empty? ? print("#{NO_ORDERS_MESSAGE}\n") : merge_orders(orders_arr)
  end

  def self.merge_orders(orders_arr)
    grouped_orders = group_orders(orders_arr)
    merged_orders = []
    grouped_orders.each do |grouped_orders_arr|
      index_order = grouped_orders_arr[0]
      user_ids = []
      order_ids = []
      quantity = 0
      price_per_kg = index_order.price_per_kg
      type = index_order.type
      grouped_orders_arr.each do |order|
        user_ids << order.user_id
        order_ids << orders_arr.index(order)
        quantity += order.quantity
      end
      merged_orders << MergedOrder.create(user_ids, quantity, price_per_kg, type, order_ids)
    end
    print_orders(merged_orders)
  end

  def self.group_orders(orders_arr)
    grouped_orders = []
    orders_arr.each do |order|
      grouped_orders << orders_arr.select { |this_order| this_order.price_per_kg == order.price_per_kg }
    end
    grouped_orders.uniq
  end

  def self.print_orders(orders)
    postfix = buy?(orders[0]) ? 'b' : 's'
    sorted_orders = sort_orders(orders)
    sorted_orders.each do |order|
      puts "#{format_order_details(order)} // #{format_order_ids(order, postfix)}"
    end
  end

  def self.sort_orders(orders)
    sorted_orders = orders.sort_by &:price_per_kg
    buy?(orders[0]) ? sorted_orders.reverse : sorted_orders
  end

  def self.buy?(index_order)
    index_order.type == :BUY
  end

  def self.format_order_details(order)
    "#{order.quantity} kg for £#{order.price_per_kg}"
  end

  def self.format_order_ids(order, postfix)
    formatted_ids = []
    order.id.each do |id|
      formatted_ids << "order #{id + 1}#{postfix}"
    end
    formatted_ids.join(' + ')
  end

  private_class_method  :display_orders,
                        :format_order_display,
                        :merge_orders,
                        :group_orders,
                        :print_orders,
                        :format_order_details,
                        :format_order_ids,
                        :sort_orders,
                        :buy?
end
