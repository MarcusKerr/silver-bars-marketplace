# frozen_string_literal: true

require 'LiveOrderBoard'

describe LiveOrderBoard do
  let(:live_order_board) { subject }

  it 'allows user to print an order summary' do
    live_order_board.buy(1, 3.5, 10)
    live_order_board.sell(2, 3.5, 20)
    expect { live_order_board.summary }.to output("LIVE ORDERS\n\nBUY:\n3.5 kg for £10 // order 1b\n\nSELL:\n3.5 kg for £20 // order 1s\n").to_stdout

  end
end
