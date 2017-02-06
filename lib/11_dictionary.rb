class Dictionary

  def initialize
    @entries = {}
  end


  def entries
    @entries
  end


  def keywords
    @entries.keys.sort
  end


  def add x
    if x.class == String
      @entries[x] = nil
    else
      x.each {|key, value| @entries[key] = value}
    end
  end


  def include? y
    if @entries.keys.include?(y)
      true
    else
      false
    end
  end


  def find z
    result = {}

    if @entries.include?(z)
      result = @entries
    else
      @entries.each do |key, value|
        if key.include?(z)
          result[key] = value
        end
      end
    end
    result
  end


  def printable
    new_string = String.new
    sorted = @entries.keys.sort
    sorted.each {|key| new_string += "[#{key}] \"#{@entries[key]}\"\n"}
    new_string.chop
  end


end
