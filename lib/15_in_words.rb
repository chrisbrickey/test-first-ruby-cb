# class FixNum
def in_words(number)

  return "zero" if number == 0
  final_string = String.new
  digit_hash = digit_hash_constructor(number)

  #loops through each 3-digit subarray
  digit_hash.keys.each_with_index do |magnitude, index|
    number_array = digit_hash[magnitude]

    next if number_array == [0, 0, 0] #true for all magnitudes
    substring = create_string_from_number(number_array)

    #last subarray is handled differently, doesn't end in "hundred"
    if index == -1
      final_string << "#{substring} "
    else
      final_string << "#{substring} #{magnitude.to_s} "
    end

  end

  final_string.chop
end#of in_words method


def digit_hash_constructor(number)

  digit_hash = Hash.new
  magnitude_hash= {
    -1 => :hundred,
    -4 => :thousand,
    -7 => :million,
    -10 => :billion,
    -13 => :trillion,
    -16 => :quadrillion
  }
  digit_array = number.to_s.chars.map {|digit_str| digit_str.to_i }

  #this block constructs the digit_hash for complete 3-digit arrays (e.g. the 000's in 1_000)
  index = -1
  (digit_array.length / 3).times do
    digit_hash[magnitude_hash[index]] = [digit_array[index - 2],
                                         digit_array[index - 1],
                                         digit_array[index]]
    index -= 3
  end

  #this block finishes construction of the digit_hash for digits that don't complete a 3-digit array (e.g. the 1 in 1_000)
  leftovers = digit_array.length % 3
  incomplete_subarray =
    case leftovers
    when 1 then [0, 0, digit_array[index]]
    when 2 then [0, digit_array[index - 1], digit_array[index]]
    end
  digit_hash[magnitude_hash[index]] = [incomplete_subarray] if leftovers != 0

  digit_hash
end

def create_string_from_number(number_array)

end

# end#of class
