require_relative '../test/trst_helper'
require 'date_shift'

class DateShiftTest < Minitest::Test
  def test_it_exists
    ds = DateShift.new

    assert_instance_of DateShift, ds
  end

  def test_it_can_create_a_numerical_date_based_on_todays_date
    ds = DateShift.new

    assert_equal 100218, ds.date
    #today is 10 02 18 
  end
end
