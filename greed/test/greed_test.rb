require 'minitest/autorun'
require_relative '../lib/greed'

class GreedTest < Minitest::Test
  def test_score_of_an_empty_list_is_zero
    assert_equal 0, Greed.score([])
  end

  def test_score_of_a_single_roll_of_5_is_50
    skip
    assert_equal 50, Greed.score([5])
  end

  def test_score_of_a_single_roll_of_1_is_100
    skip
    assert_equal 100, Greed.score([1])
  end

  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
    skip
    assert_equal 300, Greed.score([1,5,5,1])
  end

  def test_score_of_single_2s_3s_4s_and_6s_are_zero
    skip
    assert_equal 0, Greed.score([2,3,4,6])
  end

  def test_score_of_a_triple_1_is_1000
    skip
    assert_equal 1000, Greed.score([1,1,1])
  end

  def test_score_of_other_triples_is_100x
    skip
    assert_equal 200, Greed.score([2,2,2])
    assert_equal 300, Greed.score([3,3,3])
    assert_equal 400, Greed.score([4,4,4])
    assert_equal 500, Greed.score([5,5,5])
    assert_equal 600, Greed.score([6,6,6])
  end

  def test_score_of_mixed_is_sum
    skip
    assert_equal 250, Greed.score([2,5,2,2,3])
    assert_equal 550, Greed.score([5,5,5,5])
    assert_equal 1100, Greed.score([1,1,1,1])
    assert_equal 1200, Greed.score([1,1,1,1,1])
    assert_equal 1150, Greed.score([1,1,1,5,1])
  end

end
