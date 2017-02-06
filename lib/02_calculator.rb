def add a, b
  a + b
end


def subtract a, b
  a - b
end


def sum arr
  sumnum = 0
  arr.each {|num| sumnum += num}
  sumnum
end


def multiply *num
  product = 1
  num.each {|x| product *= x}
  product
end


def power a, b
  a ** b
end


def factorial num

  if num == 0
    product = 0
  else
    product = 1
  end

  (1..num).each {|x| product *= x}

  product
end
