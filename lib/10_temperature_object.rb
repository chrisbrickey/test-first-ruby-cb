class Temperature

  def initialize opts ={}   #contains either a ':celcius' entry or a ':farhenheit' entry
    @opts = opts
  end

  def in_fahrenheit
    if @opts.keys.include?(:c)
      (@opts[:c] * 9.0 / 5.0) + 32
    else
      @opts[:f]
    end
  end

  def in_celsius
    if @opts.keys.include?(:f)
      (@opts[:f] - 32) * 5.0 / 9.0
    else
      @opts[:c]
    end
  end


  def self.from_celsius deg
    Temperature.new(:c => deg)
  end

  def self.from_fahrenheit deg
    Temperature.new(:f => deg)
  end


end


class Celsius < Temperature

  def initialize deg
    @deg = deg
    @opts = {:c => deg}
  end

end


class Fahrenheit < Temperature

  def initialize deg
    @deg = deg
    @opts = {:f => deg}
  end

end
