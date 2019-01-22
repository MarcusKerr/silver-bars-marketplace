# frozen_string_literal: true

class MergedOrder < Order
  attr_reader :id
  class << self
    attr_accessor :index_order, :user_ids, :order_ids, :quantity, :price_per_kg, :type
  end

  def initialize(user_ids, quantity, price_per_kg, type, order_ids)
    super(user_ids, quantity, price_per_kg, type)
    @id = order_ids
  end

  def self.create(grouped_orders, original_orders)
    merged_orders = []
    grouped_orders.each do |grouped_orders_arr|
      set_default_values(grouped_orders_arr)
      grouped_orders_arr.each do |order|
        set_merged_order_details(order, original_orders)
      end
      merged_orders << MergedOrder.new(user_ids, quantity, price_per_kg, type, order_ids)
    end
    merged_orders
  end

  def self.set_default_values(orders_arr)
    @index_order = orders_arr[0]
    @user_ids = []
    @order_ids = []
    @quantity = 0
    @price_per_kg = @index_order.price_per_kg
    @type = @index_order.type
  end

  def self.set_merged_order_details(order, original_orders)
    @user_ids << order.user_id
    @order_ids << original_orders.index(order)
    @quantity += order.quantity
  end

  private_class_method :set_default_values, :set_merged_order_details
end
