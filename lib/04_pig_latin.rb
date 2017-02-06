def translate str
  pig_latin_sentence = String.new           #final output
  vowels = ["a", "e", "i", "o", "u"]
  english_sentence = str.split(/\s+/)

  english_sentence.each do |word|

    lowercase_word = word.downcase
    english_array = lowercase_word.split("")
    pig_latin_array = Array.new
    pig_latin_word = String.new

    if vowels.include?(english_array[0])    #case1: first letter is a vowel
      pig_latin_array.push(english_array.join() + "ay")
      pig_latin_word = pig_latin_array.join()

    else                                    #case2: first letter is NOT a vowel
      consonants = String.new
      break_position = 0

      i = 0
      while i < english_array.length

        #case 2a: come to a vowel after consonant(s)
        if vowels.include?(english_array[i])
          break_position = i
          break

        #case 2b: come to a "qu"
        elsif (i < (english_array.length - 1)) && (english_array[i] == "q") #&& (english_array[i + 1] == "u")
          consonants += english_array[i] + english_array[i + 1]
          break_position = i + 2
          break

        #case 2c: before you come to a vowel
        else
          consonants += english_array[i]

        end

        i += 1
      end

      pig_latin_array.push(english_array[break_position..-1].join() + consonants + "ay")
      pig_latin_word = pig_latin_array.join()
    end


    if word == word.capitalize                                 #case3(umbrella): english word was capitalized
      pig_latin_word.capitalize!
    end


    pig_latin_sentence += pig_latin_word + " "
  end

  pig_latin_sentence.chop
end
