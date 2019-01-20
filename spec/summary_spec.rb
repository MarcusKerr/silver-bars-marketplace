# frozen_string_literal: true

require 'Summary'

describe Summary do
  let(:mock_buy_order_1) { double :order, user_id: 10, quantity: 3.5, price_per_kg: 303, type: :BUY }
  let(:mock_buy_order_2) { double :order, user_id: 100, quantity: 35, price_per_kg: 3030, type: :BUY }

  let(:mock_sell_order_1) { double :order, user_id: 11, quantity: 4.5, price_per_kg: 404, type: :SELL }
  let(:mock_sell_order_2) { double :order, user_id: 110, quantity: 45, price_per_kg: 4040, type: :SELL }

  let(:mock_orders) { { buys: [mock_buy_order_1], sells: [mock_sell_order_1] } }
  let(:multiple_orders) { { buys: [mock_buy_order_1, mock_buy_order_2], sells: [mock_sell_order_2, mock_sell_order_1] } }
  let(:empty_orders) { { buys: [], sells: [] } }

  describe '#display' do
    it 'outputs summary information for array of orders' do
      expect { Summary.display(mock_orders) }.to output("LIVE ORDERS\n\nBUY:\n1b. 3.5kg for £303\n\nSELL:\n1s. 4.5kg for £404\n").to_stdout
    end

    context 'no orders' do
      it 'outputs information for empty orders array' do
        expect { Summary.display(empty_orders) }.to output("LIVE ORDERS\n\nBUY:\nNo orders to display\n\nSELL:\nNo orders to display\n").to_stdout
      end
    end

    context 'multiple orders' do
      it 'displays BUY orders highest price first, SELL lowest first' do
        expect { Summary.display(multiple_orders) }.to output("LIVE ORDERS\n\nBUY:\n2b. 35kg for £3030\n1b. 3.5kg for £303\n\nSELL:\n2s. 4.5kg for £404\n1s. 45kg for £4040\n").to_stdout
      end
    end
  end
end
