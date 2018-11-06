require './test/test_helper'
require './lib/decrypt'

class DecryptTest < Minitest::Test

  def test_it_exists
    to_be_decrypted = {date: "110218", key: "12345", decryption: "pdcqw"}
    decrypt = Decrypt.new(to_be_decrypted)
    assert_instance_of Decrypt, decrypt
  end

  def test_it_can_decrypt
    to_be_encrypted = {date: "110218", key: "12345", decryption: "qsjevnrxmbijazptbzufvsrxxdc!"}
    decrypt = Decrypt.new(to_be_encrypted)
    assert_equal "its no secret you cant spel!",decrypt.encrypt
  end

end
