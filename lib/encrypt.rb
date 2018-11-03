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
end
