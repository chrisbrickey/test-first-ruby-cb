def echo str
  str
end


def shout str
  str.upcase
end


def repeat str, n = 2
  new_string = String.new
  n.times {new_string += str + " "}
  new_string.chop
end


def start_of_word str, n
  str[0...n]
end


def first_word str
  str.split(/\s+/)[0]
end


def titleize str
  arr = str.split(/\s+/)
  title = arr[0].capitalize + " "

  little_words = ["a", "about", "above", "across", "after", "along", "an", "and", "around", "as", "at", "before", "behind", "between", "beyond", "but", "by", "down", "except", "following", "for", "from", "in", "into", "like", "near", "nor", "on", "of", "off", "or", "out", "over", "plus", "since", "the", "through", "to", "under", "until", "up", "upon", "with", "within", "without"]

  arr[1..-1].each do |word|
    if little_words.include?(word)
      title += word + " "
    else
      title += word.capitalize + " "
    end
  end

  title.chop
end
