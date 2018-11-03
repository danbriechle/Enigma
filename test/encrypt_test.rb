require_relative '../test/test_helper'
require "./lib/encrypt"

class EncryptTest < Minitest::Test
  def test_it_exists
    to_be_encrypted = {date: "110218", key: "12345", message: "hello"}
    encrypt = Encrypt.new(to_be_encrypted)

    assert_instance_of Encrypt, encrypt
  end

  def test_it_has_attributes
    to_be_encrypted = {date: "110218", key: "12345", message: "hello"}
    encrypt = Encrypt.new(to_be_encrypted)

    assert_equal "110218", encrypt.date
    assert_equal "12345", encrypt.key
    assert_equal "hello", encrypt.message
  end

  def test_it_can_square_date
    to_be_encrypted = {date: "110218", key: "12345", message: "hello"}
    encrypt = Encrypt.new(to_be_encrypted)
    assert_equal 12148007524, encrypt.squared
  end

  def test_it_can_get_the_last_four_digit_array_from_date_squared
    to_be_encrypted = {date: "110218", key: "12345", message: "hello"}
    encrypt = Encrypt.new(to_be_encrypted)
    assert_equal [7, 5, 2, 4], encrypt.last_four
  end

  def test_it_can_generate_first_shift_array
    to_be_encrypted = {date: "110218", key: "12345", message: "hello"}
    encrypt = Encrypt.new(to_be_encrypted)
    assert_equal [12, 23, 34, 45], encrypt.first_shift
  end

  def test_it_can_produce_the_total_shift
    to_be_encrypted = {date: "110218", key: "12345", message: "hello"}
    encrypt = Encrypt.new(to_be_encrypted)
    assert_equal [19, 28, 36, 49], encrypt.total_shift
  end

end
# initialized with a hash containg three keys:
#{date object => string , key object: => string, message object: => string}
# decrypt and encrypt may become a shift class not sure yet


#key is randomly generated if none provided must be 5 digits remember to zero pad
#Date is todays date if none is provide DDMMYY
