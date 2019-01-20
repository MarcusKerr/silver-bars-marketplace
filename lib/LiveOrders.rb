# frozen_string_literal: true

require_relative 'Order'

class LiveOrders
  attr_reader :buys, :sells
  def initialize(order = Order)
    @order = order
    @buys = []
    @sells = []
  end

  def add(user_id, order_quantity, price_per_kg, type)
    new_order = @order.register(user_id, order_quantity, price_per_kg, type)
    type == :BUY ? @buys << new_order : @sells << new_order
  end

  def cancel(order_id)
    order_index = order_id[0].to_i - 1
    order_array = order_id[1] == 'b' ? @buys : @sells
    order_array.delete_at(order_index)
  end
end
