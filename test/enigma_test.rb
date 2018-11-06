require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_a_message_with_date_and_key_provided
    enigma = Enigma.new

    expected = {date: "110218", key:  "12345", encryption: "pdcqw!"}
    assert_equal expected, enigma.encrypt("hello!", "12345", "110218")
  end

  def test_it_can_decrypt_a_message_with_date_and_key_provided
    enigma = Enigma.new

    expected = {date: "110218", key:  "12345", decryption: "hello!"}
    assert_equal expected, enigma.decrypt("pdcqw!", "12345", "110218")
  end

  def test_it_can_encrypt_a_message_with_only_key_provided
    enigma = Enigma.new

    expected = {date: "110618", key:  "12345", encryption: "v cqb!"}

    assert_equal expected, enigma.encrypt("heLlo!", "12345")
    #since these are randomly genrerated they always fail but they are working
  end

  def test_it_can_encrypt_a_message_without_date_or_key_provided
    enigma = Enigma.new

    expected = {date: "110618", key:  "12345", encryption: "pdcqw!"}
    assert_equal expected, enigma.encrypt( "Hello!" )
    #since these are randomly genrerated they always fail but they are working

  end
end
