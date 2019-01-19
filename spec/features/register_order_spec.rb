# frozen_string_literal: true

require 'LiveOrderBoard'

describe LiveOrderBoard do
  let(:live_order_board) { subject }

  it "allows a user to register 'BUY' orders" do
    expect { live_order_board.buy(1, 3.5, 303) }.not_to raise_error
  end

  it "allows a user to register 'SELL' orders" do
    expect { live_order_board.sell(1, 3.5, 303) }.not_to raise_error
  end
end
