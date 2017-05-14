class Fixnum

  def in_words
    return "zero" if self == 0

    final_string = String.new
    digit_hash = digit_hash_constructor(self)

    #loops through each 3-digit subarray
    digit_hash.keys.reverse.each do |magnitude|
      number_array = digit_hash[magnitude]

      next if number_array == [0, 0, 0]
      substring = create_string_from_number(number_array)

      if magnitude == :hundred
        final_string << "#{substring} "
      else
        final_string << "#{substring} #{magnitude.to_s} "
      end

    end

    final_string.split(/\s+/).join(" ")
  end



  def create_string_from_number(number_array)
    ones_words = [nil, "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    teens_words = [nil, "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
    tens_words = [nil, "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

    substring = String.new
    hundreds_digit, tens_digit, ones_digit = number_array

    #handles hundreds place if it has value
    if hundreds_digit != 0
      substring << "#{ones_words[hundreds_digit]} hundred "
    end

    #handles both tens_place and ones_place
    if tens_digit == 0 && ones_digit != 0     #tens/ones place < 10
      substring << "#{ones_words[ones_digit]} "

    elsif tens_digit == 1 && ones_digit != 0   #tens/ones place is a teen
      substring << "#{teens_words[ones_digit]} "

    elsif tens_digit > 0 && ones_digit == 0 #tens/ones place >= 10 but not a teen
      substring << "#{tens_words[tens_digit]} "

    elsif tens_digit > 0                    #tens/ones place <= 10s and NOT a teen
      substring << "#{tens_words[tens_digit]} #{ones_words[ones_digit]} "

    end

    substring
  end


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
    digit_hash[magnitude_hash[index]] = incomplete_subarray if leftovers != 0

    digit_hash
  end

end#of class
