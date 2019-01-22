# frozen_string_literal: true

require 'MergedOrder'

describe MergedOrder do
  let(:mock_order) { double :order, user_id: 10, quantity: 3.5, price_per_kg: 303, type: :BUY }
  let(:mock_order_2) { double :order, user_id: 100, quantity: 35, price_per_kg: 303, type: :BUY }

  let(:mock_original_orders)   { [mock_order, mock_order_2] }
  let(:mock_grouped_orders)   { [[mock_order, mock_order_2]] }

  describe '#create' do
    it 'returns an array of merged orders' do
      merged_orders = MergedOrder.create(mock_grouped_orders, mock_original_orders)
      expect(merged_orders[0]).to be_instance_of described_class
    end
  end
end
