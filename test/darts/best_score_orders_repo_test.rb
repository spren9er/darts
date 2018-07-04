# frozen_string_literal: true

require_relative '../test_helper'
require 'darts/throw'

module Darts
  class BestScoreOrdersRepoTest < Minitest::Test
    def setup
      BestScoreOrdersRepo.empty!
    end

    def teardown
      BestScoreOrdersRepo.empty!
    end

    def test_repo
      assert_empty BestScoreOrdersRepo.all
      refute BestScoreOrdersRepo.include?(156)

      BestScoreOrdersRepo.add(156, [[60, 60, 36]])

      assert BestScoreOrdersRepo.include?(156)
      assert_equal [[60, 60, 36]], BestScoreOrdersRepo[156]
      assert_equal({ 156 => [[60, 60, 36]] }, BestScoreOrdersRepo.all)

      BestScoreOrdersRepo.remove(156)

      assert_empty BestScoreOrdersRepo.all
      refute BestScoreOrdersRepo.include?(156)
    end
  end
end
