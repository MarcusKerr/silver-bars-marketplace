# frozen_string_literal: true

require 'LiveOrderBoard'

describe LiveOrderBoard do
  it 'allows a user to register an order' do
    live_order_board = LiveOrderBoard.new
    expect { live_order_board.register_order(1, 3.5, 303, 'BUY') }.not_to raise_error
  end
end
