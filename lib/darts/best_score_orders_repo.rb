# frozen_string_literal: true

module Darts
  module BestScoreOrdersRepo
    module_function

    def all
      @all ||= {}
    end

    def [](score)
      all[score]
    end

    def empty!
      @all = {}
    end

    def add(score, orders)
      all[score] = orders
    end

    def remove(score)
      all.delete(score)
    end

    def include?(score)
      all.key?(score)
    end
  end
end
