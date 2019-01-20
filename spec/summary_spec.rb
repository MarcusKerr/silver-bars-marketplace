# frozen_string_literal: true

require 'Summary'

describe Summary do
  let(:mock_buy_order) { double :order, user_id: 10, quantity: 3.5, price_per_kg: 303, type: :BUY }
  let(:mock_sell_order) { double :order, user_id: 11, quantity: 4.5, price_per_kg: 404, type: :SELL }
  let(:orders) { { buys: [mock_buy_order], sells: [mock_sell_order] } }
  let(:empty_orders) { { buys: [], sells: [] } }

  describe '#display' do
    it 'outputs summary information for array of orders' do
      expect { Summary.display(orders) }.to output("LIVE ORDERS\n\nBUY:\n1b. 3.5kg for £303\n\nSELL:\n1s. 4.5kg for £404\n").to_stdout
    end

    it 'outputs information for empty array' do
      expect { Summary.display(empty_orders) }.to output("LIVE ORDERS\n\nBUY:\nNo orders to display\n\nSELL:\nNo orders to display\n").to_stdout
    end
  end
end
