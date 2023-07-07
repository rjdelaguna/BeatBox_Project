class Node
    attr_reader :data
    attr_accessor :next_node
    def initialize(data, next_node = nil)
        @data = data
        @next_node = next_node
    end

    def last_node?
        if next_node == nil
            true
        else false
        end
    end
end