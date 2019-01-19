# frozen_string_literal: true

require 'Order'

describe Order do
  describe '#register' do
    let(:user_id) { 10 }
    let(:order_quantity) { 3.5 }
    let(:price_per_kg) { 303 }
    let(:buy) { :BUY }
    let(:sell) { :SELL }

    it "instantiates an order with type 'BUY'" do
      order = Order.register(user_id, order_quantity, price_per_kg, buy)
      expect(order.user_id).to eq 10
      expect(order.quantity).to eq 3.5
      expect(order.price_per_kg).to eq 303
      expect(order.type).to eq :BUY
    end

    it "instantiates an order with type 'SELL'" do
      order = Order.register(user_id, order_quantity, price_per_kg, sell)
      expect(order.user_id).to eq 10
      expect(order.quantity).to eq 3.5
      expect(order.price_per_kg).to eq 303
      expect(order.type).to eq :SELL
    end
  end
end
