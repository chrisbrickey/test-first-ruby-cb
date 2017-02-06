class Book

  attr_accessor :title

  def title
    arr = @title.split(/\s+/)
    cap_title = arr[0].capitalize + " "

    little_words = ["a", "about", "above", "across", "after", "along", "an", "and", "around", "as", "at", "before", "behind", "between", "beyond", "but", "by", "down", "except", "following", "for", "from", "in", "into", "like", "near", "nor", "on", "of", "off", "or", "out", "over", "plus", "since", "the", "through", "to", "under", "until", "up", "upon", "with", "within", "without"]

    arr[1..-1].each do |word|
      if little_words.include?(word)
        cap_title += word + " "
      else
      cap_title += word.capitalize + " "
      end
    end

    cap_title.chop
  end

end
