# frozen_string_literal: true

require 'LiveOrders'

describe LiveOrders do
  let(:user_id)        { 10 }
  let(:order_quantity) { 3.5 }
  let(:price_per_kg)   { 303 }
  let(:buy)            { :BUY }
  let(:sell)           { :SELL }

  let(:mock_order_class)  { double :order_class, register: mock_order }
  let(:mock_order)        { double :order_instance }

  let(:live_orders) { described_class.new(mock_order_class) }
  describe '#add' do
    context 'buy order' do
      it 'adds order to buys array' do
        expect(mock_order_class).to receive(:register).with(user_id, order_quantity, price_per_kg, buy)
        live_orders.add(user_id, order_quantity, price_per_kg, buy)
        expect(live_orders.buys).to include(mock_order)
      end
    end

    context '#sell order' do
      it 'adds order to sells array' do
        expect(mock_order_class).to receive(:register).with(user_id, order_quantity, price_per_kg, sell)
        live_orders.add(user_id, order_quantity, price_per_kg, sell)
        expect(live_orders.sells).to include(mock_order)
      end
    end
  end

  describe '#cancel' do
    context 'buy order' do
      it'removes order from buy array' do
        live_orders.add(user_id, order_quantity, price_per_kg, buy)
        expect(live_orders.buys).not_to be_empty
        live_orders.cancel('1b')
        expect(live_orders.buys).to be_empty
      end
    end

    context 'sell order' do
      it 'removes order from sell array' do
        live_orders.add(user_id, order_quantity, price_per_kg, sell)
        expect(live_orders.sells).not_to be_empty
        live_orders.cancel('1s')
        expect(live_orders.sells).to be_empty
      end
    end
  end
end
