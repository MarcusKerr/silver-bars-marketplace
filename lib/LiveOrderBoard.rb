# frozen_string_literal: true

require_relative 'Order'

class LiveOrderBoard
  def initialize(order = Order)
    @order = order
  end

  def register_order(user_id, order_quantity, price_per_kg, order_type)
    validate_details(user_id, order_quantity, price_per_kg, order_type)
    @order.register(user_id, order_quantity, price_per_kg, order_type)
  end

  private

  def validate_details(user_id, order_quantity, price_per_kg, order_type)
    validate_id(user_id)
    validate_quantity(order_quantity)
    validate_price(price_per_kg)
    validate_type(order_type)
  end

  def validate_id(user_id)
    raise 'User id must be a whole number' unless user_id.is_a? Integer
  end

  def validate_quantity(order_quantity)
    raise 'Order quantity must be a number(kg)' unless numeric?(order_quantity)
  end

  def validate_price(price_per_kg)
    raise 'Price per kg must be a number(£)' unless numeric?(price_per_kg)
  end

  def numeric?(value)
    true if value.class == Integer || value.class == Float
  end

  def validate_type(order_type)
    valid_types = %w[BUY SELL]
    raise "Order type must be 'BUY' or 'SELL'" unless valid_types.include?(order_type)
  end
end
