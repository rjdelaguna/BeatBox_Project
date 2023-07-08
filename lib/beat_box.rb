class BeatBox
    attr_reader :list
    def initialize
        @list = LinkedList.new
    end
    
    def append(string)
        if string == ""
        elsif string.index(" ") == nil
            @list.append(string)
        else seperate(string)
        end
    end

    def prepend(string)
        if string == ""
        elsif string.index(" ") == nil
            @list.prepend(string)
        else to_front(string)
        end
    end

    def to_front(string)
        string = string.reverse
        if string.index(" ") == 0
            string.slice!(0) 
            to_front(string.reverse)
        elsif string.index(" ") != 0 && string.index(" ") != nil
            text = string.slice!(0, string.index(" "))
            string.slice!(0)
            @list.prepend(text.reverse)
            prepend(string.reverse)
        else @list.prepend(string.reverse)
        end
    end

    def seperate(string)
        if string.index(" ") == 0
            string.slice!(0) 
            seperate(string)
        elsif string.index(" ") != 0 && string.index(" ") != nil
            text = string.slice!(0, string.index(" "))
            string.slice!(0)
            @list.append(text)
            append(string)
        else @list.append(string)
        end
    end

    def count
        @list.count
    end

    def to_string
        @list.to_string
    end

    def play
        `say -r 500 -v Boing #{@list.to_string}`
    end



end