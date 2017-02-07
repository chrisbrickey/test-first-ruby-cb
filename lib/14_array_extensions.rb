class Array

  def sum
    sum = 0
    self.each {|num| sum += num}
    sum
  end

  def square
    result = []
    if self != []
      self.each {|num| result.push(num * num)}
    end
    result
  end

  def square!
    0.upto(self.length - 1) {|i| self[i] = self[i] * self[i]}
  end

end
