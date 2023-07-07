require "./lib/linked_list"
require "./lib/node"

RSpec.describe LinkedList do
    it "exists" do
        list = LinkedList.new

        expect(list).to be_an_instance_of(LinkedList)
    end

    it "has a head attribute that is empty" do
        list = LinkedList.new

        expect(list.head).to eq(nil)
    end

    it "append adds single node to list" do
        list = LinkedList.new
        list.append("doop")

        expect(list.head.data).to eq("doop")
        expect(list.head.next_node).to eq (nil)
    end
    
    it "counts the number of nodes" do
        list = LinkedList.new
        list.append("doop")

        expect(list.count).to eq(1)
    end

    it "returns string containing all data of nodes" do
        list = LinkedList.new
        list.append("doop")

        expect(list.to_string).to eq("doop")
    end

    describe "multiple nodes" do
        it "new list still has empty head position" do
            list = LinkedList.new
            
            expect(list.head).to eq(nil)
        end

        it "appends a single node into the head position" do
            list = LinkedList.new
            list.append("doop")

            expect(list.head.data).to eq("doop")
            expect(list.head.next_node).to eq(nil)
        end

        it "appends two nodes, the first being the head" do
            list = LinkedList.new
            list.append("doop")
            list.append("deep")
            list.append("bop")
            list.append("oop")
#require 'pry'; binding.pry
            expect(list.head.data).to eq("doop")
            expect(list.head.next_node.data).to eq("deep")
            expect(list.head.next_node.next_node.data).to eq("bop")
            expect(list.count).to eq(4)
            expect(list.to_string).to eq("doop deep bop oop")
        end
    end

end