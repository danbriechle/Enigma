require_relative '../test/test_helper'
require './lib/date_shift'

class DateShiftTest < Minitest::Test
  def test_it_exists
    ds = DateShift.new

    assert_instance_of DateShift, ds
  end

  def test_it_can_create_a_numerical_date_based_on_todays_date
    ds = DateShift.new

    assert_equal 110218, ds.date
    #today is 11 02 18
  end
end
