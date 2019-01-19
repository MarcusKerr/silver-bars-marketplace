# frozen_string_literal: true

require 'Order'

describe Order do
  let(:Order) { subject }
  describe '#register' do
    it 'instantiates a new order with specified details' do
      order = Order.register(10, 3.5, 303, :BUY)
      expect(order.user_id).to eq 10
      expect(order.quantity).to eq 3.5
      expect(order.price_per_kg).to eq 303
      expect(order.type).to eq :BUY
    end
  end
end
