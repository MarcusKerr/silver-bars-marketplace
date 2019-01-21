# frozen_string_literal: true

require 'MergedOrder'

describe MergedOrder do
  let(:user_ids)       { [10, 11, 12] }
  let(:order_ids)      { [101, 101, 102] }
  let(:order_quantity) { 3.5 }
  let(:price_per_kg)   { 303 }
  let(:buy)            { :BUY }
  let(:sell)           { :SELL }

  describe '#create' do
    it 'instantiates a new merged order with specified details' do
      merged_order = MergedOrder.create(user_ids, quantity, price_per_kg, type, order_ids)
      expect(order.user_ids).to eq [10, 11, 12]
      expect(order.order_ids).to eq [101,101,102]
      expect(order.quantity).to eq 3.5
      expect(order.price_per_kg).to eq 303
      expect(order.type).to eq :BUY
    end
  end
end
