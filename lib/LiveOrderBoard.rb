# frozen_string_literal: true

require_relative 'Order'
require_relative 'Summary'

class LiveOrderBoard
  USER_ID_ERROR = 'User id must be a whole number'
  QUANTITY_ERROR = 'Order quantity must be a number(kg)'
  PRICE_ERROR = 'Price per kg must be a number(£)'
  attr_reader :orders

  def initialize(order = Order, summary = Summary)
    @order = order
    @summary = summary
    @orders = { buys: [], sells: [] }
  end

  def buy(user_id, order_quantity, price_per_kg)
    validate_details(user_id, order_quantity, price_per_kg)
    @orders[:buys] << @order.register(user_id, order_quantity, price_per_kg, :BUY)
  end

  def sell(user_id, order_quantity, price_per_kg)
    validate_details(user_id, order_quantity, price_per_kg)
    @orders[:sells] << @order.register(user_id, order_quantity, price_per_kg, :SELL)
  end

  def summary
    @summary.display(@orders)
  end

  private

  def validate_details(user_id, order_quantity, price_per_kg)
    validate_id(user_id)
    validate_quantity(order_quantity)
    validate_price(price_per_kg)
  end

  def validate_id(user_id)
    raise USER_ID_ERROR unless user_id.is_a? Integer
  end

  def validate_quantity(order_quantity)
    raise QUANTITY_ERROR unless numeric?(order_quantity)
  end

  def validate_price(price_per_kg)
    raise PRICE_ERROR unless numeric?(price_per_kg)
  end

  def numeric?(value)
    true if value.class == Integer || value.class == Float
  end
end
