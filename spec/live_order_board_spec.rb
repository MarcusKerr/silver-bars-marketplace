# frozen_string_literal: true

require 'LiveOrderBoard'

describe LiveOrderBoard do
  let(:user_id) { 10 }
  let(:order_quantity) { 3.5 }
  let(:price_per_kg) { 303 }
  let(:buy) { :BUY }
  let(:sell) { :SELL }

  let(:mock_order_class) { double :order_class, register: mock_order }
  let(:mock_order) { double :order_instance }

  let(:mock_summary_class) { double :summary_class }

  let(:live_order_board) { described_class.new(mock_order_class, mock_summary_class) }

  describe '#buy' do
    it 'delegates to Order' do
      expect(mock_order_class).to receive(:register).with(user_id, order_quantity, price_per_kg, buy)
      live_order_board.buy(user_id, order_quantity, price_per_kg)
    end

    it 'adds order to buy array' do
      live_order_board.buy(user_id, order_quantity, price_per_kg)
      expect(live_order_board.orders[:buys]).to include(mock_order)
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
    it 'delegates to Order' do
      expect(mock_order_class).to receive(:register).with(user_id, order_quantity, price_per_kg, sell)
      live_order_board.sell(user_id, order_quantity, price_per_kg)
    end

    it 'adds order to sell array' do
      live_order_board.sell(user_id, order_quantity, price_per_kg)
      expect(live_order_board.orders[:sells]).to include(mock_order)
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
  end

  describe '#summary' do
    it 'delegates to Summary' do
      expect(mock_summary_class).to receive(:display).with(hash_including(buys: [], sells: []))
      live_order_board.summary
    end
  end

  describe '#cancel' do
    context 'cancelling buy order' do
      it 'removes order from buy array' do
        live_order_board.buy(user_id, order_quantity, price_per_kg)
        live_order_board.cancel('1b')
        expect(live_order_board.orders[:buys]).not_to include(mock_order)
      end
    end
  end
end
