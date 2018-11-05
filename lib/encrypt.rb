require_relative '../lib/cypher'

class Encrypt

  include Cypher
  attr_reader :date, :key, :message, :alphabet

  def initialize(encrypt_hash)
    @date = encrypt_hash[:date]
    @key = encrypt_hash[:key]
    @message = encrypt_hash[:message]
    @alphabet = ("a".."z").to_a << " "

  end

end
