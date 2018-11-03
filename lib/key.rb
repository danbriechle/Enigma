require 'SecureRandom'
require 'pry'
class Key
  attr_reader :first_shift
  def initialize
    @first_shift = number_generator
  end

  def number_generator
   number = SecureRandom.random_number(99999).to_s.ljust(5, "0").to_i
   number
  end


end
