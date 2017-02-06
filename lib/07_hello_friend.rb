class Friend

  def greeting name = nil

    if name == nil
      "Hello!"
    else
      "Hello, #{name}!"
    end

    #Condensed alternative
    # "Hello" + ((name == nil) ? "!" : ", #{name}!")
  end

end
