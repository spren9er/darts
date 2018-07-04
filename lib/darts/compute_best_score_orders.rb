# frozen_string_literal: true

require_relative 'best_score_orders'
require_relative 'best_score_orders_repo'

module Darts
  class ComputeBestScoreOrders
    def initialize(score)
      @score = score
    end

    def call
      return build_orders([[score]]) if checkout?
      build_orders(
        best_orders.flat_map do |(first_score, best_order)|
          best_order.orders.map { |order| [first_score, *order] }
        end
      )
    end

    private

    def best_orders
      possible_orders.group_by { |(_, ord)| ord.number_of_throws }.min.last
    end

    def possible_orders
      SINGLE_SCORES
        .select { |single| score - single > 1 }
        .map { |scr| [scr, orders_for(score - scr)] }
    end

    def checkout?
      CHECKOUTS.include?(score)
    end

    def build_orders(orders)
      best_orders = BestScoreOrders.new(score, orders)
      BestScoreOrdersRepo.add(score, best_orders)
    end

    def orders_for(other)
      return BestScoreOrdersRepo[other] if BestScoreOrdersRepo.include?(other)
      ComputeBestScoreOrders.new(other).call
    end

    attr_reader :score
  end
end
