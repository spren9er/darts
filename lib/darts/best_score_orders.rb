# frozen_string_literal: true

require_relative 'throw'

module Darts
  class BestScoreOrders
    attr_reader :score, :orders

    def initialize(score, orders)
      @score  = score
      @orders = process(orders)
    end

    def count
      orders.count
    end

    def number_of_throws
      orders.first.size
    end

    def throws
      orders.map { |order| Darts::Throw.new(order).call.join(' ') }
    end

    private

    def process(orders)
      %i[reduce normalize sort]
        .reduce(orders) { |ord, method| send(method, ord) }
    end

    def reduce(orders)
      orders.uniq { |order| order[0..-2].sort }
    end

    def normalize(orders)
      orders.map { |order| [*order[0..-2].sort.reverse, order.last] }
    end

    def sort(orders)
      orders.sort_by do |order|
        [Darts::FAV_CHECKOUTS.index(order.last), *order.map(&:-@)]
      end
    end
  end
end
