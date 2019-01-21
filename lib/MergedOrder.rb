# frozen_string_literal: true

class MergedOrder < Order
  attr_reader :order_ids

  def initialize(user_ids, quantity, price_per_kg, type, order_ids)
    super(user_ids, quantity, price_per_kg, type)
    @order_ids = order_ids
  end

  def self.create(user_ids, quantity, price_per_kg, type, order_ids)
    MergedOrder.new(user_ids, quantity, price_per_kg, type, order_ids)
  end
end
