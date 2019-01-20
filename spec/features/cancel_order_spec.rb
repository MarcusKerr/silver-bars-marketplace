# frozen_string_literal: true

require 'LiveOrderBoard'

describe LiveOrderBoard do
  let(:live_order_board) { subject }

  it 'allows a user to cancel a registered order' do
    live_order_board.buy(1, 3.5, 303)
    expect { live_order_board.cancel_order('1b') }.not_to raise_error
  end
end
