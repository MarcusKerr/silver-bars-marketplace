# frozen_string_literal: true

require 'Summary'

describe Summary do
  let(:mock_buy_order_1) { double :order, user_id: 10, quantity: 3.5, price_per_kg: 303, type: :BUY }
  let(:mock_buy_order_2) { double :order, user_id: 100, quantity: 35, price_per_kg: 3030, type: :BUY }
  let(:mock_buy_order_3) { double :order, user_id: 1000, quantity: 350, price_per_kg: 3030, type: :BUY }

  let(:mock_sell_order_1) { double :order, user_id: 11, quantity: 4.5, price_per_kg: 404, type: :SELL }
  let(:mock_sell_order_2) { double :order, user_id: 110, quantity: 45, price_per_kg: 4040, type: :SELL }
  let(:mock_sell_order_3) { double :order, user_id: 111, quantity: 450, price_per_kg: 4040, type: :SELL }

  let(:mock_live_orders)           { double :live_orders_instance, buys: [mock_buy_order_1], sells: [mock_sell_order_1] }
  let(:mock_live_orders_multiple)  { double :live_orders_instance, buys: [mock_buy_order_1, mock_buy_order_2], sells: [mock_sell_order_2, mock_sell_order_1] }
  let(:mock_live_orders_empty)     { double :live_orders_instance, buys: [], sells: [] }
  let(:mock_liver_orders_merge)    { double :live_orders_instance, buys: [mock_buy_order_1, mock_buy_order_2, mock_buy_order_3], sells: [mock_sell_order_1, mock_sell_order_2, mock_sell_order_3] }

  describe '#display' do
    it 'outputs summary information for array of orders' do
      expect { Summary.display(mock_live_orders) }.to output("LIVE ORDERS\n\nBUY:\n3.5 kg for £303 // order 1b\n\nSELL:\n4.5 kg for £404 // order 1s\n").to_stdout
    end

    context 'no orders' do
      it 'outputs information for empty orders array' do
        expect { Summary.display(mock_live_orders_empty) }.to output("LIVE ORDERS\n\nBUY:\nNo orders to display\n\nSELL:\nNo orders to display\n").to_stdout
      end
    end

    context 'multiple orders' do
      it 'displays BUY orders highest price first, SELL lowest first' do
        expect { Summary.display(mock_live_orders_multiple) }.to output("LIVE ORDERS\n\nBUY:\n35 kg for £3030 // order 2b\n3.5 kg for £303 // order 1b\n\nSELL:\n4.5 kg for £404 // order 2s\n45 kg for £4040 // order 1s\n").to_stdout
      end
    end

    it 'merges orders of the same price' do
      expect { Summary.display(mock_liver_orders_merge) }.to output("LIVE ORDERS\n\nBUY:\n385 kg for £3030 // order 2b + order 3b\n3.5 kg for £303 // order 1b\n\nSELL:\n4.5 kg for £404 // order 1s\n495 kg for £4040 // order 2s + order 3s\n").to_stdout
    end
  end
end
