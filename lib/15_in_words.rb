class Fixnum

  def in_words
    print "===================NEW TEST=======================\n"

      if self == 0
        return "zero"
      end

      ones_string = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
      tens_string = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
      teens_string = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
      magnitude_label = ['trillion', 'billion', 'million', 'thousand', 'hundred']


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
        # write = left/i               #the number we are working with now
        # left = left - (write * i)    #the number left to process
        # print "write: #{write}       left: #{left}\n"


        #THOUSANDS PLACE (i == 1000)
        print "entered thousands place in the loop\n"
        write = left / 1000
        left = left - (write * 1000)
        print "write: #{write}       left: #{left}\n"

        if write >= 100   #hundred thousands
          final_string += ones_string[write - 1] + " "
          final_string += magnitude_label[-2] + " "
          print final_string + "!!\n"

        elsif write >= 10    #tens of thousands
          final_string += tens_string[write - 1] + " "
          final_string += magnitude_label[-2] + " "
          print final_string + "!!\n"

        elsif write > 0    #single digit thousands
          final_string += ones_string[write - 1] + " "
          final_string += magnitude_label[-2] + " "
          print final_string + "!!\n"
        end


        # if write > 0
        #   #TENS PLACE for larger numbers
        #   print "entered tens method\n"
        #   write = left/10
        #   left = left - (write * 10) #subtract off the tens
        #   print "write: #{write}       left: #{left}\n"
        #
        #   if write > 0
        #
        #     if (write == 1) and (left > 0)   #SPECIAL CASE FOR TEENAGERS
        #       final_string += teens_string[left - 1] + " "
        #       print final_string + "!!\n"
        #       left = 0
        #     else      #FOR 20+
        #       final_string += tens_string[write - 1] + " "
        #       print final_string + "!!\n"
        #     end
        #
        #       #ONES PLACE for larger numbers
        #       print "entered ones method\n"
        #       write = left
        #       left = 0    #subtract off the ones
        #       print "write: #{write}       left: #{left}\n"
        #
        #       if write > 0
        #         final_string += ones_string[write - 1] + " "
        #         print final_string + "!!\n"
        #       end
        #
        #       print final_string + "!!\n"
        #       final_string
        #   end
        #
        # end
        i -= 1000    #change this to take a base 10
        j += 1
        x = [left, final_string]
        print x
        print "above is the x-array\n"
      end #end of while loop


      #to make hundreds work outside the loop, I changed all x[0] below to left because they were not equivalent
      #HUNDREDS PLACE
      print "entered actual hundreds place\n"
      write = left / 100
      left = left - (write * 100)
      print "write: #{write}       left: #{left}\n"

      if write > 0
        final_string += ones_string[write - 1] + " " + magnitude_label[-1] + " "
        print final_string + "!!\n"
      end

      #TENS PLACE
      print "entered actual tens place\n"
      print "write: #{write}       left: #{left}         x[0]:#{x[0]}\n"
      write = left / 10
      left = left - (write * 10) #subtract off the tens
      print "write: #{write}       left: #{left}         x[0]:#{x[0]}\n"

      if write > 0
        if (write == 1) and (left > 0)   #special case for teens
          final_string += teens_string[left - 1] + " "
          print final_string + "!!\n"
          left = 0
        else  #10, 20, 30........
          final_string += tens_string[write - 1] + " "
          print final_string + "!!\n"
        end
      end

      #ONES PLACE
      print "entered actual ones place\n"
      write = left
      left = 0    #subtract off the ones
      print "write: #{write}       left: #{left}\n"

      if write > 0
        final_string += ones_string[write - 1] + " "
        print final_string + "!!\n"
      end

      print final_string + "!!\n"
      final_string.chop
    end #end of method


end #end of class
