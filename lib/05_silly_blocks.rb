def reverser
  reverse_str = String.new    #final output
  forward_arr = yield.split(/\s+/)
  forward_arr.each {|word| reverse_str += (word.reverse + " ")}
  reverse_str.chop
end

def adder n = 1
  yield + n
end

def repeater n = 1
  n.times {yield}
end
