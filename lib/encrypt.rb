class Encrypt
  attr_reader :date, :key, :message
  def initialize(encrypt_hash)
    @date = encrypt_hash[:date]
    @key = encrypt_hash[:key]
    @message = encrypt_hash[:message]
  end
end
