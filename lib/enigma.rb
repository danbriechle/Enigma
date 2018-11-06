require './lib/date_generator'
require './lib/key'
require './lib/encrypt'
require './lib/decrypt'

class Enigma
  def initialize
    @encrypt = {message: nil,
                date: DateGenerator.new.date,
                key: Key.new.first_shift}
    @decrypt = {message: nil,
                date: DateGenerator.new.date,
                key: Key.new.first_shift}
  end

  def encrypt(message, key = @encrypt[:key], date = @encrypt[:date])
    @encrypt = {encryption: message,
                key: key,
                date: date}

    encrypted = Encrypt.new(@encrypt).encrypt
    @encrypt = {date: date.to_s,
                key: key.to_s,
                encryption: encrypted}
  end

  def decrypt(message, key, date)
    @decrypt = {decryption: message,
                date: date,
                key: key}
    decrypted = Decrypt.new(@decrypt).encrypt

    @decrypt = {date: date.to_s,
                key: key.to_s,
                decryption: decrypted}
  end

end
