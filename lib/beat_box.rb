class BeatBox
    attr_reader :list
    def initialize
        @list = LinkedList.new
    end
    
    def append(string)
        if string.index(" ") == nil
            @list.append(string)
        else seperate(string)
        end
    end

    def seperate(string)
        text = string.slice!(0, string.index(" "))
        string.slice!(0)
        if string == 0 
            @list.append(text)
        else @list.append(text)
            append(string)
        end
    end



end