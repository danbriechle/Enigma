module Cypher

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
    single_digits = @key.to_s.split("")
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
    end.map.with_index do |position, value|
     [value, position]
   end
  end

  def message_reduce_index
    @message.split("").map.with_index do |value, position|
      [position%4,  value]
    end
  end

  def swap(mini_array,total_shift_mini_array)
    if total_shift_mini_array[0] == mini_array[0]
      mini_array[0] = total_shift_mini_array[1]
    end
    [mini_array[0], mini_array[1]]
  end

  def index_swap_with_shift
    message_reduce_index.each do |mini_array|
      total_shift.map do |total_shift_mini_array|
        swap(mini_array,total_shift_mini_array)
    end
    end
  end

  def encrypt_helper(mini_array)
    if @alphabet.include?(mini_array[1].downcase)
      @alphabet[@alphabet.find_index(mini_array[1].downcase) - (mini_array[0] % @alphabet.size)]
    else
      mini_array[1]
    end
  end

  def encrypt
    encrypted = index_swap_with_shift.map do |letter_shift_pair|
      encrypt_helper(letter_shift_pair)
    end
    encrypted.join
  end

end
