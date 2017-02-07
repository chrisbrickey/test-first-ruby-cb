class Fixnum

  def in_words

      if self == 0
        return "zero"
      end

      ones_string = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
      tens_string = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
      teens_string = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
      magnitude_label = [' billion', ' million', ' thousand', ' hundred']


      final_string = ''
      left = self
      write = 0
      x = []

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

      while i > 99
        j = 0
        write = left/i               #the number we are working with now
        left = left - (write * i)    #the number left to process
        print "write: #{write}       left: #{left}\n"

        if write > 0
          #TENS PLACE for larger numbers
          print "entering tens method\n"
          write = left/10
          left = left - (write * 10) #subtract off the tens
          print "write: #{write}       left: #{left}\n"

          if write > 0

            if (write == 1) and (left > 0)   #SPECIAL CASE FOR TEENAGERS
              final_string += teens_string[left - 1] + " "
              left = 0
            else      #FOR 20+
              final_string += tens_string[write - 1] + " "
            end

              #ONES PLACE for larger numbers
              print "entering ones method\n"
              write = left
              left = 0    #subtract off the ones
              print "write: #{write}       left: #{left}\n"

              if write > 0
                final_string += ones_string[write - 1] + " "
              end
              final_string
          end
          final_string += magnitude_label[j] + " "

          if left > 0
            final_string += ' '
          end
        end
          # i - 1000
        i -= 100
        j += 1
        x = [left, final_string]
        print x
        print "above is the x-array\n"
      end

      #TENS PLACE
      print "entering actual tens place\n"
      write = x[0]/10
      left = x[0] - (write * 10) #subtract off the tens
      print "write: #{write}       left: #{left}\n"

      if write > 0

        if (write == 1) and (left > 0)   #SPECIAL CASE FOR TEENAGERS
          final_string = x[1] + teens_string[left - 1] + " "
          left = 0
        else      #FOR 20+
          final_string = x[1] + tens_string[write - 1] + " "
        end

      end

      #ONES PLACE
      print "entering actual ones place\n"
      write = left
      left = 0    #subtract off the ones
      print "write: #{write}       left: #{left}\n"

      if write > 0
        final_string += ones_string[write - 1] + " "
      end

      final_string.chop
    end #end of method


end #end of class
