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

  def first_shift
    single_digits = @key.split("")
    double_digits = single_digits.zip(single_digits.rotate).map do |mini_array|
      mini_array[0] + mini_array[1]
    end
    first_shift_array = double_digits.map do |digit|
      digit.to_i
    end
    first_shift_array.pop
    first_shift_array
  end

  def total_shift
    last_four.zip(first_shift).map do |mini_array|
      mini_array[0] + mini_array[1]
    end
  end

  def message_reduce_index
    @message.split("").map.with_index do |value, position|
      [position%4,  value]
    end
  end

  def index_swap_with_shift

  end

  # .map.with_index do |position, value|
  #  [value, position]


end
