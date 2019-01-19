# frozen_string_literal: true

require_relative 'Order'

class LiveOrderBoard
  def initialize(order = Order)
    @order = order
  end

  def register_order(user_id, order_quantity, price_per_kg, order_type)
    @order.register(user_id, order_quantity, price_per_kg, order_type)
  end
end
