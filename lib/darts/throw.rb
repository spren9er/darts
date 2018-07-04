# frozen_string_literal: true

module Darts
  class Throw
    def initialize(score_order)
      @score_order = score_order
    end

    def call
      *first_scores, last_score = score_order
      [*first_scores.map { |i| regular_throw(i) }, last_throw(last_score)]
    end

    private

    def regular_throw(score)
      return bull if bull?(score)
      return single(score) if score <= 20 || single_bull?(score)
      return double(score) if score.even? && score <= 40
      triple(score)
    end

    def last_throw(score)
      return bull if bull?(score)
      double(score)
    end

    def single(score)
      return bull if bull?(score)
      score.to_s
    end

    def double(score)
      "D#{score / 2}"
    end

    def triple(score)
      "T#{score / 3}"
    end

    def bull
      'BULL'
    end

    def bull?(score)
      score == 50
    end

    def single_bull?(score)
      score == 25
    end

    attr_reader :score_order
  end
end
