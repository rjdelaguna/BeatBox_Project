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

    def prepend(text)
        node = Node.new(text)
        if @head == nil
            @head = node
        else node.next_node = @head
            @head = node
        end
    end

    def insert(position, text)
        node = Node.new(text)
        if @head == nil
            @head = node
        elsif position == 0
            node.next_node = @head
            @head = node
        else first = node_position(@head, position - 1)
            following_node = node_position(head, position)
            first.next_node = node
            node.next_node = following_node
            node
        end
    end

    def node_position(node, position, counter = 0)
        if position == counter
            node
        else node_position(node.next_node, position, counter += 1)
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