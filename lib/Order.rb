# frozen_string_literal: true

class Order
  attr_reader :user_id, :quantity, :price_per_kg, :type
  def initialize(user_id, quantity, price_per_kg, type)
    @user_id = user_id
    @quantity = quantity
    @price_per_kg = price_per_kg
    @type = type
  end

  def self.register(user_id, quantity, price_per_kg, type)
    Order.new(user_id, quantity, price_per_kg, type)
  end
end
