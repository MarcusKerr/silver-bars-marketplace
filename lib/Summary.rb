# frozen_string_literal: true

class Summary
  def self.display(orders)
    print"LIVE ORDERS\n\n"
    print"BUY:\n"
    orders[:buys].each do |order|
      printf("%sb. %10s\n", ((orders[:buys].index(order) + 1)).to_s, "#{order.quantity}kg for £#{order.price_per_kg}")
    end

    print "\nSELL:\n"
    orders[:sales].each do |order|
      printf("%ss. %10s\n", ((orders[:sales].index(order) + 1)).to_s, "#{order.quantity}kg for £#{order.price_per_kg}")
    end
  end
end
