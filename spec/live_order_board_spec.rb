# frozen_string_literal: true

require 'LiveOrderBoard'

describe LiveOrderBoard do
  let(:user_id) { 1 }
  let(:order_quantity) { 3.5 }
  let(:price_per_kg) { 303 }
  let(:order_type) { :BUY }

  let(:mock_order_class) { double :order_class, register: mock_order }
  let(:mock_order) { double :order_instane }

  let(:live_order_board) {described_class.new(mock_order_class)}

  describe '#register_order' do
    it 'delegates to the order object' do
      expect(mock_order_class).to receive(:register).with(user_id, order_quantity, price_per_kg, order_type)
      live_order_board.register_order(user_id, order_quantity, price_per_kg, order_type)
    end

    it 'raises error if invalid user id is submitted' do
      expect { live_order_board.register_order('user_id', order_quantity, price_per_kg, order_type) }.to raise_error('User id must be a whole number')
    end

    it 'raises error if invalid order quantity is submitted' do
      expect { live_order_board.register_order(user_id, 'order_quantity', price_per_kg, order_type) }.to raise_error('Order quantity must be a number(kg)')
    end

    it 'raises error if invalid price is submitted' do
      expect { live_order_board.register_order(user_id, order_quantity, 'price_per_kg', order_type) }.to raise_error('Price per kg must be a number(£)')
    end

    it 'raises error if invalid type id is submitted' do
      expect { live_order_board.register_order(user_id, order_quantity, price_per_kg, 'order_type') }.to raise_error("Order type must be 'BUY' or 'SELL'")
    end
  end
end
