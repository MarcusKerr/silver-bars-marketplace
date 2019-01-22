# frozen_string_literal: true

require 'MergedOrder'

describe MergedOrder do
  let(:user_ids) { [10, 11, 12] }
  let(:order_ids) { [101, 101, 102] }
  let(:quantity)       { 3.5 }
  let(:price_per_kg)   { 303 }
  let(:buy)            { :BUY }
  let(:sell)           { :SELL }

  let(:mock_original_orders)  { [] }
  let(:mock_grouped_orders)   { [] }

  describe '#create' do
    it 'returns an array' do
      expect(MergedOrder.create(mock_grouped_orders, mock_original_orders)).to be_kind_of(Array)
    end
  end
end
