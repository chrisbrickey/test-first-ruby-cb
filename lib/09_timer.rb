class Timer

  attr_accessor :seconds

  def seconds
    0
  end


  def time_string

    hours_string = String.new
    minutes_string = String.new
    seconds_string = String.new

    hours = (@seconds / 3600).to_i
    minutes = ((@seconds % 3600) / 60).to_i
    seconds = @seconds % 60

    if hours < 10
      hours_string = "0#{hours}:"
    else
      hours_string = "#{hours}:"
    end

    if minutes < 10
      minutes_string = "0#{minutes}:"
    else
      minutes_string = "#{minutes}:"
    end

    if seconds < 10
      seconds_string = "0#{seconds}"
    else
      seconds_string = "#{seconds}"
    end

    hours_string + minutes_string + seconds_string
  end


end
