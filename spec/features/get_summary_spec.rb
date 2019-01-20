# frozen_string_literal: true

require 'LiveOrderBoard'

describe LiveOrderBoard do
  let(:live_order_board) { subject }

  it 'allows user to print an order summary' do
    expect { live_order_board.get_summary }.not_to raise_error
  end
end
