# frozen_string_literal: true

require_relative 'darts/version'
require_relative 'darts/compute_best_score_orders'

module Darts
  def self.max_power(int)
    return 0 if int.odd?
    max_power(int / 2) + 1
  end

  SINGLE_SCORES = 1.upto(20).flat_map { |i| [i, 2 * i, 3 * i] }.uniq + [25, 50]
  CHECKOUTS     = 1.upto(20).map { |i| 2 * i } + [50]
  FAV_CHECKOUTS = CHECKOUTS.sort_by { |i| [max_power(i), i] }.reverse
end
