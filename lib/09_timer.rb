class Timer

  attr_accessor :seconds

  def seconds
    0
  end

  def padded n
    pad = String.new
    pad = "0" if n < 9
    pad + n.to_s
  end

  def time_string
    hours = (@seconds / 3600).to_i
    minutes = ((@seconds % 3600) / 60).to_i
    seconds = @seconds % 60

    padded(hours) + ":" + padded(minutes) + ":" + padded(seconds)
  end


end
