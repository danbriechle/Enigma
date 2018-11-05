require './test/test_helper'
require './lib/enigma'

class EnigmaTest
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_a_message_with_date_key_provided
    enigma = Enigma.new

    expected = {date: "110218", key:  "12345", message: "pdcqw!"}
    assert_equal expected, enigma.encrypt("110218", "12345", "hello!")
  end

  def test_it_can_decrypt_a_message_with_date_and_key_provided
    enigma = Enigma.new

    expected = {date: "110218", key:  "12345", message: "hello!"}
    assert_equal expected, enigma.encrypt("110218", "12345", "pdcqw!")
  end

  def test_it_can_encrypt_a_message_with_only_key_provided
    enigma = Enigma.new

    expected = {date: "110518", key:  "12345", message: "pdcqw!"}
    assert_equal expected, enigma.encrypt("12345", "hello")
  end

  def test_it_can_encrypt_a_message_without_date_or_key_provided
    enigma = Enigma.new

    expected = {date: "110518", key:  "12345", message: "pdcqw!"}
    assert_equal expected, enigma.encrypt( "hello" )
  end
end
