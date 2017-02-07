class RPNCalculator
  $operators = ['+', '-', '*', '/']

  def initialize
    @calculator = Array.new
  end


  def push new_element
    @calculator << new_element
  end


  def value
    @calculator[-1]
  end


  def plus
    handle_fails
    calculate_and_update(@calculator, :+)
  end


  def minus
    handle_fails
    calculate_and_update(@calculator, :-)
  end


  def times
    handle_fails
    calculate_and_update(@calculator, :*)
  end


  def divide
    handle_fails
    calculate_and_update(@calculator, :/)
  end


  def calculate_and_update arr, sym

    new_element = case sym
    when :+
      (arr[-2].to_f + arr[-1].to_f)
    when :-
      (arr[-2].to_f - arr[-1].to_f)
    when :*
      (arr[-2].to_f * arr[-1].to_f)
    else #:/
      (arr[-2].to_f / arr[-1].to_f)
    end

    2.times {arr.pop}
    arr << new_element
  end


  def handle_fails
    raise ArgumentError, 'calculator is empty' unless @calculator.length > 0
  end


  def tokens str
    new_arr = Array.new
    old_arr = str.split(/\s+/)

    old_arr.each do |element|
      if $operators.include?(element)
        new_arr.push(element.to_sym)
      else
        new_arr.push(element.to_i)
      end
    end

    new_arr
  end


  def evaluate str

    my_proc = Proc.new do |arr_ops, arr_nums|
      0.upto(arr_ops.length - 1) do |j|
        calculate_and_update(arr_nums, arr_ops[j])
      end
    end

    arr_nums = Array.new
    arr_ops = Array.new
    arr_origin = str.split(/\s+/)

    0.upto(arr_origin.length - 1) do |i|

      #case1: this element is an operator AND so is the next one
      if ($operators.include?(arr_origin[i])) && ($operators.include?(arr_origin[i + 1]))
        arr_ops.push(arr_origin[i].to_sym)

      #case2: this element is an operator BUT the next one is a number OR does not exist
      elsif ($operators.include?(arr_origin[i]))
        arr_ops.push(arr_origin[i].to_sym)
        my_proc.call arr_ops, arr_nums
        arr_ops = Array.new     #reset ops array for subsequent operations

      #case3: this element is a number
      else
        arr_nums.push(arr_origin[i].to_i)
      end

    end

    arr_nums[-1]
  end

end
