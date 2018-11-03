require_relative '../test/test_helper'
require "./lib/encrypt"

class EncryptTest < Minitest::Test
  def test_it_exists
    to_be_encrypted = {date: "100218", key: "12345", message: "hello"}
    encrypt = Encrypt.new(to_be_encrypted)

    assert_instance_of Encrypt, encrypt
  end

  def test_it_has_attributes
    to_be_encrypted = {date: "100218", key: "12345", message: "hello"}
    encrypt = Encrypt.new(to_be_encrypted)

    assert_equal "100218", encrypt.date
    assert_equal "12345", encrypt.key
    assert_equal "hello", encrypt.message
  end
end
# initialized with a hash containg three keys:
#{date object => string , key object: => string, message object: => string}
# decrypt and encrypt may become a shift class not sure yet


#key is randomly generated if none provided must be 5 digits remember to zero pad
#Date is todays date if none is provide DDMMYY
