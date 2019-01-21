# frozen_string_literal: true

require 'MergedOrder'

describe MergedOrder do
  let(:user_ids) { [10, 11, 12] }
  let(:order_ids) { [101, 101, 102] }
  let(:quantity)       { 3.5 }
  let(:price_per_kg)   { 303 }
  let(:buy)            { :BUY }
  let(:sell)           { :SELL }

  describe '#create' do
    it 'instantiates a new merged order with buy details' do
      merged_order = MergedOrder.create(user_ids, quantity, price_per_kg, buy, order_ids)
      expect(merged_order.user_id).to eq [10, 11, 12]
      expect(merged_order.quantity).to eq 3.5
      expect(merged_order.price_per_kg).to eq 303
      expect(merged_order.type).to eq :BUY
      expect(merged_order.id).to eq [101, 101, 102]
    end

    it 'instantiates a new merged order with sell details' do
      merged_order = MergedOrder.create(user_ids, quantity, price_per_kg, sell, order_ids)
      expect(merged_order.user_id).to eq [10, 11, 12]
      expect(merged_order.quantity).to eq 3.5
      expect(merged_order.price_per_kg).to eq 303
      expect(merged_order.type).to eq :SELL
      expect(merged_order.id).to eq [101, 101, 102]
    end
  end
end
