class BeatBox
    attr_reader :list
    def initialize
        @list = LinkedList.new
    end
    
    def append(string)
        if string == ""
        elsif string.index(" ") == nil && sort(string) == true
            @list.append(string)
        else seperate(string)
        end
    end

    def prepend(string)
        if string == ""
        elsif string.index(" ") == nil && sort(string) == true
            @list.prepend(string)
        else string = string.reverse
            seperate(string)
        end
    end

    def seperate(string)
        if string.index(" ") == 0
            string.slice!(0) 
            seperate(string)
        elsif string == ""
        elsif string.index(" ") != nil
            text = string.slice!(0, string.index(" "))
            string.slice!(0)
            if caller.join.include?("prepend") == true && sort(text) == true
                prepend(text.reverse)
            elsif sort(text) == true
                append(text)
            else
            end
            seperate(string)
        elsif string.index(" ") == nil && sort(string) == true
            if caller.join.include?("prepend") == true && sort(string) == true
                prepend(string.reverse)
            elsif sort(string) == true
                append(string)
            else
            end
        end
    end

    def sort(text)
        acceptable = "deep woo shi shu blop dep plop dop suu doo ditt hoo sweep fee mee tee keep holy moly ram blam bam doop oop beep"
        if acceptable.include?(text) || acceptable.include?(text.reverse)
            true
        else false
        end
    end


    def count
        @list.count
    end

    def all
        @list.to_string
    end

    def play
        `say -r 500 -v Boing #{@list.to_string}`
    end



end