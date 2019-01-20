# frozen_string_literal: true

require 'LiveOrderBoard'

describe LiveOrderBoard do
  let(:live_order_board) { subject }

  it 'allows a user to cancel a registered order' do
    live_order_board.buy(1, 3.5, 303)
    live_order_board.cancel('1b')
    expect { live_order_board.summary }.to output("LIVE ORDERS\n\nBUY:\nNo orders to display\n\nSELL:\nNo orders to display\n").to_stdout
  end
end
