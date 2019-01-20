# frozen_string_literal: true

require 'Summary'

describe Summary do
  let(:mock_buy_order) { double :order, user_id: 10, quantity: 3.5, price_per_kg: 303, type: :BUY }
  let(:mock_sell_order) { double :order, user_id: 11, quantity: 4.5, price_per_kg: 404, type: :SELL }
  let(:orders_array) {[mock_buy_order, mock_sell_order]}

  describe '#display' do
    it 'outputs summary information' do
      expect { Summary.display(orders_array) }.to output(" LIVE ORDERS\n|IDs    |BUY            |IDs    |SELL           |\n|1b    |3.5 kg for £303|1s    |4.4 kg for £404|\n").to_stdout
    end
  end
end
