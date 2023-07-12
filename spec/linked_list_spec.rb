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

  it "uses a tail method to identify last node" do
    list = LinkedList.new
    list.append("doop")
    list.append("dep")
    list.append("pop")

    expect(list.tail(list.head)).to eq(list.head.next_node.next_node)
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

  describe "holding multiple nodes" do
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
            
      expect(list.head.data).to eq("doop")
      expect(list.head.next_node.data).to eq("deep")
      expect(list.head.next_node.next_node.data).to eq("bop")
      expect(list.count).to eq(4)
      expect(list.to_string).to eq("doop deep bop oop")
    end

    it "uses counter methode for multiple node count" do
      list = LinkedList.new
      list.append("doop")
      list.append("deep")
      list.append("bop")
      list.append("oop")

      expect(list.counter(list.head, 1)).to eq(4)
    end

    it "uses string method to combine node data" do
      list = LinkedList.new
      list.append("doop")
      list.append("deep")
      list.append("bop")
      list.append("oop")

      expect(list.string(list.head.next_node, "#{list.head.data}")).to eq("doop deep bop oop")
    end

  end

  describe "prepending a single node into head position" do
    it "still appends nodes" do
      list = LinkedList.new
      list.append("plop")
      list.append("suu")

      expect(list.to_string).to eq("plop suu")
    end

    it "prepends new node as head" do
      list = LinkedList.new
      list.append("plop")
      list.prepend("dop")
      list.append("beep")
      list.prepend("suu")
      list.append("ram")
      list.prepend("bam")

      expect(list.to_string).to eq("bam suu dop plop beep ram")
    end
  end
  
  describe "inserting node aynwhere" do
    it "places node at selected link" do
      list = LinkedList.new
      list.append("plop")
      list.prepend("dop")
      list.append("beep")
      list.prepend("suu")
      list.append("ram")
      list.prepend("bam")
      list.insert(0, "woo")
      list.insert(5, "blam")

      expect(list.count).to eq(8)
      expect(list.to_string).to eq("woo bam suu dop plop blam beep ram")
    end
  end

  describe "finding requested link data" do
    it "returns data in called position, plus those following" do
      list = LinkedList.new
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.find(2, 1)).to eq("shi")
      expect(list.find(1, 3)).to eq("woo shi shu")
    end
  end

  describe "whether data lives in list" do
    it "returns true/false if data exists" do
      list = LinkedList.new
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.includes?("deep")).to eq(true)
      expect(list.includes?("dep")).to eq(false)
    end
  end

  describe "removing link from end of list" do
    it "removes last data from list" do
      list = LinkedList.new
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")
            
      list.pop

      expect(list.to_string).to eq("deep woo shi shu")

      list.pop

      expect(list.to_string).to eq("deep woo shi")
    end
  end
end