class Fixnum

  def in_words
    print "===================NEW TEST=======================\n"

      if self == 0
        return "zero"
      end

      ones_string = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
      tens_string = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
      teens_string = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
      magnitude = ['trillion', 'billion', 'million', 'thousand', 'hundred', ""]


      #=========begining of hundreds proc=======================
      hundreds_proc = Proc.new do |write, left, final_string, mag|  #mag = -3 for thousands
        print "entered hundreds proc\n"
        x = Array.new
        print "write: #{write}       left: #{left}\n"
        local_write = write/100              #e.g. 9 from 982
        local_left =  (write.to_i) - (local_write * 100) #subtract off the hundreds   e.g. 82 from 982
        print "after adjusting the inputs...\n"
        print "local_write: #{local_write}       local_left: #{local_left}\n"

        if local_write > 0
          final_string += ones_string[local_write - 1] + " " + magnitude[-2] + " "
        end

        print "about to exit hundreds proc\n"
        print "local_left: #{local_left}\n"
        x.push(local_left)
        print final_string + "!!\n"
        x.push(final_string)
        print x
        print "leaving hundreds proc\n"
        x       #x = [local_left, final_string]
      end

      #=========end of hundreds proc=======================



      #=========begining of tens proc=======================
      tens_proc = Proc.new do |local_write, local_left, final_string, mag|  #mag = -3 for thousands
        print "entered tens proc\n"
        x = Array.new
        local_write = local_left/10
        local_left =  (local_left.to_i) - (local_write * 10) #subtract off the tens
        print "local_write: #{local_write}       local_left: #{local_left}\n"

        if mag < -1  #handling hundreds or higher...mag = -2, -3, etc
          if (local_write == 1) && (local_left > 0)  #teens
            final_string += teens_string[local_left - 1] + " "
            final_string += magnitude[mag] + " "
            print final_string + "!!\n"
            local_left = 0
          elsif  (local_write > 0)  #handling 10, 20 30
            final_string += tens_string[local_write - 1] + " "
            print final_string + "!!\n"
          end
        else  #handling small numbers (mag == -1 (blank))
          if (local_write == 1) && (local_left > 0)  #teens
            final_string += teens_string[local_left - 1] + " "
            print final_string + "!!\n"
            local_left = 0
          elsif (local_write > 0) #handling 10, 20 30
            final_string += tens_string[local_write - 1] + " "
            print final_string + "!!\n"
          end
        end

        print "about to exit tens proc\n"
        print "local_left: #{local_left}\n"
        x.push(local_left)
        print final_string + "!!\n"
        x.push(final_string)
        print x
        print "leaving tens proc\n"
        x       #x = [local_left, final_string]
      end

      #=========end of tens proc=======================



      #=========begining of ones proc=======================
      ones_proc = Proc.new do |local_write, local_left, final_string, mag|  #mag = -3 for thousands
        print "entered ones proc\n"
        print "local_write: #{local_write}       local_left: #{local_left} should mirror actual write and left for mag -1\n"
        local_write = local_left
        local_left = 0    #subtract off the ones
        print "after adjusting the inputs...\n"
        print "local_write: #{local_write}       local_left: #{local_left}\n"

        if (local_write > 0) && (mag < -1)  #handling hundreds or higher...mag = -2, -3, etc
          final_string += ones_string[local_write - 1] + " "
          final_string += magnitude[mag] + " "
          print final_string + "!!\n"
        elsif (local_write > 0) #handling small numbers...mag == -1 (blank)
          final_string += ones_string[local_write - 1] + " "
          print final_string + "!!\n"
        end

        print final_string + "!!\n"
        final_string
      end
      #=========end of ones proc=======================

      final_string = ''
      left = self
      write = 0
      x = [left, final_string]

      if left < 1_000
        i = 1000
      elsif left < 10_000
        i = 10_000
      elsif left < 100_000
        i = 100_000
      elsif left < 1_000_000
        i = 1_000_000
      elsif left < 10_000_000
        i = 10_000_000
      elsif left < 100_000_000
        i = 100_000_000
      elsif left < 1_000_000_000
        i = 1_000_000_000
      elsif left < 10_000_000_000
        i = 10_000_000_000
      elsif left < 100_000_000_000
        i = 100_000_000_000
      elsif left < 1_000_000_000_000
        i = 1_000_000_000_000
      else
        i = 10_000_000_000_000
      end

      while i > 999
        print "i = #{i}\n"
        print "entered the LOOP\n"
        j = 0
        write = left / i               #the number we are working with now
        left = left - (write * i)     #the number left to process
        print "write: #{write}       left: #{left}\n"

        if i <= 1_000_000
          #THOUSANDS PLACE (i == 1000)
          print "entered thousands place in the loop\n"
          write = left / 1000
          left = left - (write * 1000)
          print "write: #{write}       left: #{left}\n"

          if write >= 100   #hundred thousands e.g. 982_536; write = 982....left = 536 (need this for below loop)
            print "entering hundreds of thousands\n"

            #HUNDREDS PLACE for larger numbers with Proc
            print "entered hundreds method\n"
            print "write: #{write}       left: #{left}\n"
            print "about to call hundreds PROC\n"
            x = hundreds_proc.call write, left, final_string, -3  #x = [local_left, final_string]
            local_left = x[0]
            final_string = x[1]
            print "after calling hundreds PROC....\n"
            print "     local_left: #{local_left}\n"
            print final_string + "!!\n"


            #TENS PLACE for larger numbers WITH PROC
            print "about to call tens PROC\n"
            x = tens_proc.call write, local_left, final_string, -3  #x = [local_left, final_string]
            local_left = x[0]
            final_string = x[1]
            print "after calling tens PROC\n"
            print "  local_left: #{local_left}\n"
            print final_string + "!!\n"


            #ONES PLACE for larger numbers WITH PROC
            print "about to call ones PROC\n"
            final_string = ones_proc.call write, local_left, final_string, -3
            print "after calling ones PROC\n"
            print "    local_left: #{local_left}\n"
            print final_string + "!!\n"


          elsif write >= 10    #tens of thousands (e.g. write = 32)
            print "entering tens of thousands\n"


            #TENS PLACE for larger numbers WITH PROC
            print "about to call tens PROC\n"
            x = tens_proc.call 0, write, final_string, -3  #x = [local_left, final_string]
            local_left = x[0]
            final_string = x[1]
            print "after calling tens PROC\n"
            print "    local_left: #{local_left}\n"
            print final_string + "!!\n"


            #ONES PLACE for larger numbers WITH PROC
            print "about to call ones PROC\n"
            final_string = ones_proc.call write, local_left, final_string, -3
            print "after calling ones PROC\n"
            print "    local_left: #{local_left}\n"
            print final_string + "!!\n"


        elsif write > 0    #single digit thousands

          #ONES PLACE for larger numbers WITH PROC
          print "about to call ones PROC\n"
          final_string = ones_proc.call 0, write, final_string, -3
          print "after calling ones PROC\n"
          print "    local_left: #{local_left}\n"
          print final_string + "!!\n"

        end
      end  #of if i === 1000

      print final_string + "!!\n"


      i -= 1000    #change this to take a base 10
      j += 1
      x = [left, final_string]
      print x
      print "above is the x-array\n"
    end #end of while loop========================================================


      #HUNDREDS PLACE with a Proc
      print "entered actual hundreds place\n"
      print "write: #{write}       left: #{left}\n"
      print "about to call hundreds PROC\n"
      x = hundreds_proc.call left, write, final_string, -2  #x = [local_left, final_string]
      local_left = x[0]
      final_string = x[1]
      print "after calling hundreds PROC....\n"
      print "     local_left: #{local_left}\n"
      print final_string + "!!\n"


      #TENS PLACE with Proc
      print "entered actual tens place\n"
      print "write: #{write}       left: #{left}   local_left: #{local_left}\n"
      print "about to call tens PROC\n"
      x = tens_proc.call write, local_left, final_string, -1  #x = [local_left, final_string]
      local_left = x[0]
      final_string = x[1]
      print "after calling tens PROC\n"
      print "      local_left: #{local_left}\n"
      print final_string + "!!\n"

      #ONES PLACE WITH PROC
      print "entered actual ones place\n"
      print "write: #{write}       left: #{left}\n"
      print "     local_left: #{local_left}\n"
      print "about to call ones PROC\n"
      final_string = ones_proc.call write, local_left, final_string, -1
      print "after calling ones PROC\n"
      print "     local_left: #{local_left}\n"
      print final_string + "!!\n"


      print final_string + "!!\n"
      final_string.chop
    end #end of method


end #end of class
