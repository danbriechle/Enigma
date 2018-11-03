class Encrypt
  attr_reader :date, :key, :message
  def initialize(encrypt_hash)
    @date = encrypt_hash[:date]
    @key = encrypt_hash[:key]
    @message = encrypt_hash[:message]
  end

  def squared
    date.to_i * date.to_i
  end

  def last_four
    numbers = squared.to_s.split("").map do |number|
      number.to_i
    end
    numbers.last(4)
  end
end
