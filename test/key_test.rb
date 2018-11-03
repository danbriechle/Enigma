require_relative '../test_helper'
require "./lib/key"

class KeyTest < Minitest::Test
  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_it_can_generate_a_5_digit_number
    key = Key.new

    assert_instance_of Integer, key.number
    assert_equal 5, key.to_s.length
  end
end
