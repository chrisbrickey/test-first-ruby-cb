class XmlDocument

  # attr_accessor :hello

  def send tag_name #tag_name is an array of string literal letters
    "<#{tag_name}/>"
  end

  def hello hash = {}, &block

    if block
      "<hello>#{block.call}</hello>"

    elsif hash == {}
        "<hello/>"

    else
      key = hash.keys.to_s[2..-2]
      value = hash.values[0]
      "<hello #{key}=\"#{value}\"/>"
    end

  end


  def goodbye
    "<goodbye/>"
  end


  def come_back
    "<come_back>"
  end


  def ok_fine hash = {}
    key = hash.keys.to_s[2..-2]
    value = hash.values[0]
    "<ok_fine #{key}=\"#{value}\"/>"
  end


end
