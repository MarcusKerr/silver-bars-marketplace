# frozen_string_literal: true

require 'LiveOrderBoard'

describe LiveOrderBoard do
  let(:live_order_board) { subject }

  it 'allows user to print an order summary' do
    live_order_board.buy(10, 3.5, 303)
    live_order_board.sell(11, 4.5, 404)
    expect { live_order_board.summary }.to output(" LIVE ORDERS\n|IDs    |BUY            |IDs    |SELL           |\n|1b    |3.5 kg for £303|1s    |4.4 kg for £404|\n").to_stdout
  end
end
