# frozen_string_literal: true

require_relative '../test_helper'
require 'darts/throw'

module Darts
  class ThrowTest < Minitest::Test
    def test_call
      assert_equal ['BULL', '25', 'D18'],  Throw.new([50, 25, 36]).call
      assert_equal ['D12', 'D18', 'BULL'], Throw.new([24, 36, 50]).call
      assert_equal ['T13', 'D20', 'D5'],   Throw.new([39, 40, 10]).call
    end
  end
end
