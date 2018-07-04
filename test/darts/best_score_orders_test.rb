# frozen_string_literal: true

require_relative '../test_helper'
require 'darts/throw'

module Darts
  class BestScoreOrdersTest < Minitest::Test
    def setup
      @bso_095 = BestScoreOrders.new( 95, [[45, 50], [57, 38]])
      @bso_153 = BestScoreOrders.new(153, [[60, 57, 36]])
      @bso_157 = BestScoreOrders.new(157, [[60, 57, 40], [57, 50, 50]])
    end

    def test_count
      assert_equal 2, @bso_095.count
      assert_equal 1, @bso_153.count
      assert_equal 2, @bso_157.count
    end

    def test_number_of_throws
      assert_equal 2, @bso_095.number_of_throws
      assert_equal 3, @bso_153.number_of_throws
      assert_equal 3, @bso_157.number_of_throws
    end

    def test_throws
      assert_equal ['T15 BULL', 'T19 D19'],          @bso_095.throws
      assert_equal ['T20 T19 D18'],                  @bso_153.throws
      assert_equal ['T20 T19 D20', 'T19 BULL BULL'], @bso_157.throws
    end
  end
end
