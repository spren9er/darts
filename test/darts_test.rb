require 'test_helper'

class DartsTest < Minitest::Test
  def setup
    Darts::ComputeBestScoreOrders.new(501).call
  end

  def test_all_possible_three_dart_checkout_scores
    expected_threes = [
      2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 160, 161, 164, 167, 170
    ]

    actual_threes = Darts::BestScoreOrdersRepo.all
                      .select { |_, orders| orders.number_of_throws < 4 }
                      .keys.sort

    assert_equal expected_threes, actual_threes
  end

  def test_all_possible_nine_dart_finishes
    nine_dart_finishes = [
      'T20 T20 T20 T20 T20 T20 T17 BULL D20',
      'T20 T20 T20 T20 T20 T19 T18 BULL D20',
      'T20 T20 T20 T20 T19 T19 T19 BULL D20',
      'T20 T20 T20 T20 T20 T20 T20 T19 D12',
      'T20 T20 T20 T20 T20 T20 T20 T15 D18',
      'T20 T20 T20 T20 T20 T20 T19 T16 D18',
      'T20 T20 T20 T20 T20 T20 T18 T17 D18',
      'T20 T20 T20 T20 T20 T19 T19 T17 D18',
      'T20 T20 T20 T20 T20 T19 T18 T18 D18',
      'T20 T20 T20 T20 T19 T19 T19 T18 D18',
      'T20 T20 T20 T19 T19 T19 T19 T19 D18',
      'T20 T20 T20 T20 T20 T20 T19 D17 BULL',
      'T20 T20 T20 T20 T20 T20 T17 D20 BULL',
      'T20 T20 T20 T20 T20 T19 T18 D20 BULL',
      'T20 T20 T20 T20 T20 T17 BULL BULL BULL',
      'T20 T20 T20 T20 T19 T19 T19 D20 BULL',
      'T20 T20 T20 T20 T19 T18 BULL BULL BULL',
      'T20 T20 T20 T19 T19 T19 BULL BULL BULL',
      'T20 T20 T20 T20 T20 T20 T19 BULL D17',
      'T20 T20 T20 T20 T20 T20 T20 T17 D15',
      'T20 T20 T20 T20 T20 T20 T19 T18 D15',
      'T20 T20 T20 T20 T20 T19 T19 T19 D15'
    ]
    assert_equal nine_dart_finishes, Darts::BestScoreOrdersRepo[501].throws
  end
end
