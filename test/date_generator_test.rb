require './test/test_helper'
require './lib/date_generator'

class DateGenratorTest < Minitest::Test
  def test_it_exists
    ds = DateGenerator.new

    assert_instance_of DateGenerator, ds
  end

  def test_it_can_create_a_numerical_date_based_on_todays_date
    ds = DateGenerator.new

    assert_equal 110318, ds.date
  end
  
end
