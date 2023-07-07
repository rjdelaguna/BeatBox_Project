class LinkedList
    attr_reader :head
    def initialize
        @head = nil
    end

    def append(text)
        node = Node.new(text)
        @head = node
    end

    def count
        if @head == nil
            0
        else 1
        end
    end

    def to_string
        "#{@head.data}"
    end
end