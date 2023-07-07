class LinkedList
    attr_accessor :head
    def initialize
        @head = nil
    end

    def append(text)
        node = Node.new(text)
        if @head == nil
            @head = node
        else tail(@head).next_node = node
        end
    end

    def tail(node)
        if node.last_node? == true
            node
        else tail(node.next_node)
        end
    end

    def count
        if @head == nil
            0
        else counter(@head, 1)
        end
    end

    def counter(node, count)
        if node.last_node? == true
            count
        else counter(node.next_node, count += 1)
        end
    end


    def to_string
        if @head == nil
            ""
        elsif @head.last_node? == true
            "#{head.data}"
        else string(@head.next_node, "#{head.data}")
        end
    end

    def string(node, starter)
        if node.last_node? == true
            starter << " #{node.data}"
        else starter << " #{node.data}"
            string(node.next_node, starter)
        end
    end

end