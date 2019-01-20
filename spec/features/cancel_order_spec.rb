# frozen_string_literal: true

require 'LiveOrderBoard'

describe LiveOrderBoard do
  let(:live_order_board) { subject }

  context 'buy order' do
    it 'allows a user to cancel a registered buy order' do
      live_order_board.buy(1, 3.5, 303)
      expect { live_order_board.cancel_order('1b') }.not_to raise_error
    end
  end

  context 'sell order' do
    it 'allows a user to cancel a registered sell order' do
      live_order_board.sell(1, 3.5, 303)
      expect { live_order_board.cancel_order('1s') }.not_to raise_error
    end
  end
end
