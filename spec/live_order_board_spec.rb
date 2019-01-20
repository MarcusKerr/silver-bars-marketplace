# frozen_string_literal: true

require 'LiveOrderBoard'

describe LiveOrderBoard do
  let(:user_id)        { 10 }
  let(:order_quantity) { 3.5 }
  let(:price_per_kg)   { 303 }
  let(:buy)            { :BUY }
  let(:sell)           { :SELL }

  let(:mock_live_orders)    { double :live_orders_instance }
  let(:mock_summary_class)  { double :summary_class }

  let(:live_order_board) { described_class.new(mock_live_orders, mock_summary_class) }

  describe '#buy' do
    it 'delegates to LiveOrders' do
      expect(mock_live_orders).to receive(:add).with(user_id, order_quantity, price_per_kg, buy)
      live_order_board.buy(user_id, order_quantity, price_per_kg)
    end

    it 'raises error if invalid user id is submitted' do
      expect { live_order_board.buy('user_id', order_quantity, price_per_kg) }.to raise_error('User id must be a whole number')
    end

    it 'raises error if invalid order quantity is submitted' do
      expect { live_order_board.buy(user_id, 'order_quantity', price_per_kg) }.to raise_error('Order quantity must be a number(kg)')
    end

    it 'raises error if invalid price is submitted' do
      expect { live_order_board.buy(user_id, order_quantity, 'price_per_kg') }.to raise_error('Price per kg must be a number(£)')
    end
  end

  describe '#sell' do
    it 'delegates to LiveOrder' do
      expect(mock_live_orders).to receive(:add).with(user_id, order_quantity, price_per_kg, sell)
      live_order_board.sell(user_id, order_quantity, price_per_kg)
    end

    it 'raises error if invalid user id is submitted' do
      expect { live_order_board.sell('user_id', order_quantity, price_per_kg) }.to raise_error('User id must be a whole number')
    end

    it 'raises error if invalid order quantity is submitted' do
      expect { live_order_board.sell(user_id, 'order_quantity', price_per_kg) }.to raise_error('Order quantity must be a number(kg)')
    end

    it 'raises error if invalid price is submitted' do
      expect { live_order_board.sell(user_id, order_quantity, 'price_per_kg') }.to raise_error('Price per kg must be a number(£)')
    end

    describe '#summary' do
      it 'delegates to Summary' do
        expect(mock_summary_class).to receive(:display).with(mock_live_orders)
        live_order_board.summary
      end
    end

    describe '#cancel' do
      it 'delegates to LiveOrder' do
        expect(mock_live_orders).to receive(:cancel).with('1b')
        live_order_board.cancel_order('1b')
      end
    end
  end
end
