class Fixnum

  def in_words

      if self == 0
        return "zero"
      end

      ones_string = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
      tens_string = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
      teens_string = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
      magnitude = ['trillion', 'billion', 'million', 'thousand', 'hundred', ""]


      hundreds_proc = Proc.new do |write, left, final_string, mag|
        x = Array.new
        local_write = write/100
        local_left =  (write.to_i) - (local_write * 100)

        if local_write > 0
          final_string += ones_string[local_write - 1] + " "
          final_string += magnitude[-2] + " "
        end

        x.push(local_left)
        x.push(final_string)
      end


      tens_proc = Proc.new do |local_write, local_left, final_string, mag|
        x = Array.new
        local_write = local_left/10
        local_left =  (local_left.to_i) - (local_write * 10)

        if mag < -1  #handling hundreds or higher
          if (local_write == 1) && (local_left > 0)  #teens
            final_string += teens_string[local_left - 1] + " " + magnitude[mag] + " "
            local_left = 0
          elsif  (local_write > 0)  #10, 20 30
            final_string += tens_string[local_write - 1] + " "
            if local_write == 1
              final_string += magnitude[mag] + " "
            end
          end

        else  #handling small numbers
          if (local_write == 1) && (local_left > 0)  #teens
            final_string += teens_string[local_left - 1] + " "
            local_left = 0
          elsif (local_write > 0) #10, 20 30, etc
            final_string += tens_string[local_write - 1] + " "
          end
        end

        x.push(local_left)
        x.push(final_string)
      end


      ones_proc = Proc.new do |local_write, local_left, final_string, mag|
        local_write = local_left
        local_left = 0

        if (local_write > 0) && (mag < -1)  #handling hundreds or higher
          final_string += ones_string[local_write - 1] + " "
          # final_string += magnitude[mag] + " "
        elsif (local_write > 0) #handling small numbers
          final_string += ones_string[local_write - 1] + " "
        end

        final_string
      end


      three_digit_proc = Proc.new do |write, left, final_string, mag|
        x = hundreds_proc.call write, left, final_string, mag  #x = [local_left, final_string]
        local_left = x[0]
        final_string = x[1]

        x = tens_proc.call write, local_left, final_string, mag  #x = [local_left, final_string]
        local_left = x[0]
        final_string = x[1]

        final_string = ones_proc.call write, local_left, final_string, mag
      end

      two_digit_proc = Proc.new do |write, final_string, mag|
        x = tens_proc.call 0, write, final_string, mag  #x = [local_left, final_string]
        local_left = x[0]
        final_string = x[1]

        final_string = ones_proc.call write, local_left, final_string, mag
      end



      final_string = String.new
      left = self

      i = 10_000_000_000_000

      while i > 999

        if i <= 1_000_000  #THOUSANDS
          mag = -3
          write = left / 1000
          left = left - (write * 1000)

          if write >= 100 #hundred thousands
            x = hundreds_proc.call write, left, final_string, mag  #x = [local_left, final_string]
            local_left = x[0]
            final_string = x[1]

            x = tens_proc.call write, local_left, final_string, mag  #x = [local_left, final_string]
            local_left = x[0]
            final_string = x[1]

            final_string = ones_proc.call write, local_left, final_string, mag

          elsif write >= 10  #ten thousands
            x = tens_proc.call 0, write, final_string, mag  #x = [local_left, final_string]
            local_left = x[0]
            final_string = x[1]
\
            final_string = ones_proc.call write, local_left, final_string, mag

          elsif write > 0   #single digit thousands
            final_string = ones_proc.call 0, write, final_string, mag
          end

          if write > 0
            final_string += magnitude[mag] + " "
          end


        elsif i <= 1_000_000_000   #MILLIONS
          mag = -4
          write = left / 1_000_000
          left = left - (write * 1_000_000)

          if write >= 100   #hundred millions
            x = hundreds_proc.call write, left, final_string, mag  #x = [local_left, final_string]
            local_left = x[0]
            final_string = x[1]

            x = tens_proc.call write, local_left, final_string, mag  #x = [local_left, final_string]
            local_left = x[0]
            final_string = x[1]

            final_string = ones_proc.call write, local_left, final_string, mag

          elsif write >= 10    #ten millions
            x = tens_proc.call 0, write, final_string, mag  #x = [local_left, final_string]
            local_left = x[0]
            final_string = x[1]

            final_string = ones_proc.call write, local_left, final_string, mag

          elsif write > 0    #single digit millions
            final_string = ones_proc.call 0, write, final_string, mag
          end

          if write > 0
            final_string += magnitude[mag] + " "
          end


        elsif i <= 1_000_000_000_000   #BILLIONS
          mag = -5
          write = left / 1_000_000_000
          left = left - (write * 1_000_000_000)

          if write >= 100   #hundred billions
            # three_digit_proc.call write, left, final_string, mag

            x = hundreds_proc.call write, left, final_string, mag  #x = [local_left, final_string]
            local_left = x[0]
            final_string = x[1]

            x = tens_proc.call write, local_left, final_string, mag  #x = [local_left, final_string]
            local_left = x[0]
            final_string = x[1]

            final_string = ones_proc.call write, local_left, final_string, mag

          elsif write >= 10    #ten billions
            x = tens_proc.call 0, write, final_string, mag  #x = [local_left, final_string]
            local_left = x[0]
            final_string = x[1]

            final_string = ones_proc.call write, local_left, final_string, mag

          elsif write > 0    #single digit billions
            final_string = ones_proc.call 0, write, final_string, mag
          end

          if write > 0
            final_string += magnitude[mag] + " "
          end


        elsif i <= 1_000_000_000_000_000   #TRILLIONS
          mag = -6
          write = left / 1_000_000_000_000
          left = left - (write * 1_000_000_000_000)

          if write >= 100   #hundred trillions
            three_digit_proc.call write, left, final_string, mag

          elsif write >= 10    #ten trillions
            two_digit_proc.call write, final_string, mag

          elsif write > 0    #single digit trillions
            final_string = ones_proc.call 0, write, final_string, mag
          end

          if write > 0
            final_string += magnitude[mag] + " "
          end


        end

      i /= 10
    end #end of while loop


      #For the last three digits...
      x = hundreds_proc.call left, write, final_string, -2  #x = [local_left, final_string]
      local_left = x[0]
      final_string = x[1]

      x = tens_proc.call write, local_left, final_string, -1  #x = [local_left, final_string]
      local_left = x[0]
      final_string = x[1]

      final_string = ones_proc.call write, local_left, final_string, -1


      final_string.chop
    end #end of method


end #end of class
