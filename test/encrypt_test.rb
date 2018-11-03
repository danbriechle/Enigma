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

  def test_it_can_produce_the_total_shift_with_index
    to_be_encrypted = {date: "110218", key: "12345", message: "hello"}
    encrypt = Encrypt.new(to_be_encrypted)
    assert_equal [[0, 19], [1, 28], [2, 36], [3, 49]], encrypt.total_shift
  end

  def test_it_can_reduce_message_index_to_four_values
    to_be_encrypted = {date: "110218", key: "12345", message: "hello"}
    encrypt = Encrypt.new(to_be_encrypted)
    expected = [[0, "h"], [1, "e"], [2, "l"], [3, "l"], [0, "o"]]
    assert_equal expected, encrypt.message_reduce_index
  end

  def test_for_index_swap_helper_method
    to_be_encrypted = {date: "110218", key: "12345", message: "hello"}
    encrypt = Encrypt.new(to_be_encrypted)
    mini_array = [0, "h"]
    total_shift_mini_array =[0, 19]
    assert_equal [19, "h"], encrypt.swap(mini_array, total_shift_mini_array)

  end

  def test_reduced_message_index_can_be_swapped_with_shift
    to_be_encrypted = {date: "110218", key: "12345", message: "hello"}
    encrypt = Encrypt.new(to_be_encrypted)
    expected = [[19, "h"], [28, "e"], [36, "l"], [49, "l"], [19, "o"]]
    assert_equal expected, encrypt.index_swap_with_shift
  end

  def test_alphabet_is_in_place
    to_be_encrypted = {date: "110218", key: "12345", message: "hello"}
    encrypt = Encrypt.new(to_be_encrypted)
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
       "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
        "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, encrypt.alphabet
  end

  def test_it_can_encrypt_just_one_index_letter_pair
    to_be_encrypted = {date: "110218", key: "12345", message: "hello"}
    encrypt = Encrypt.new(to_be_encrypted)
    mini_array = [19 , "h"]
    mini_array_2 = [19 , "o"]
    mini_array_3 = [36, "l"]
    assert_equal "p", encrypt.encrypt_helper(mini_array)
    assert_equal "w", encrypt.encrypt_helper(mini_array_2)
    assert_equal "c", encrypt.encrypt_helper(mini_array_3)
  end

  def test_it_can_encrypt_a_whole_meesage
    to_be_encrypted = {date: "110218", key: "12345", message: "hello"}
    encrypt = Encrypt.new(to_be_encrypted)
    assert_equal "pdcqw", encrypt.encrypt
  end

  def test_it_can_encrypt_a_longer_meesage_with_spaces
    to_be_encrypted = {date: "110218", key: "12345", message: "its no secret you cant spel"}
    encrypt = Encrypt.new(to_be_encrypted)
    assert_equal "qsjevnrxmbijazptbzufvsrxxdc", encrypt.encrypt
  end

end


# initialized with a hash containg three keys:
#{date object => string , key object: => string, message object: => string}
# decrypt and encrypt may become a shift class not sure yet


#key is randomly generated if none provided must be 5 digits remember to zero pad
#Date is todays date if none is provide DDMMYY
