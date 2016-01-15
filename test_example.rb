require "minitest/autorun"

class TestExamples < Minitest::Test
  def test_that_true_is_true
    assert true
  end

  def test_that_false_is_false
    refute false
  end

  def test_that_number_are_equal
    assert_equal 2, 1
  end
end
