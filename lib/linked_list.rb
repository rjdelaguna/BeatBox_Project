class LinkedList
    attr_accessor :head
    def initialize
        @head = nil
    end

    def append(text)
        node = Node.new(text)
        if @head == nil
            @head = node
        else @head.next_node = node
        end
    end

    def count
        if @head == nil
            0
        elsif @head.next_node == nil
            1
        else 2
        end
    end

    def to_string
        if @head.next_node == nil
            "#{@head.data}"
        else string = "#{@head.data}" << " #{@head.next_node.data}"
            string
        end
    end
end