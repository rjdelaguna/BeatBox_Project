require "./lib/node"

RSpec.describe Node do
  it "exists" do
    node = Node.new("plop")

    expect(node).to be_an_instance_of(Node)
  end

  it "has readable attributes" do
    node = Node.new("plop")

    expect(node.data).to eq("plop")
  end

  it "identifies the next node as nil" do
    node = Node.new("plop")

    expect(node.next_node).to eq(nil)
  end

  describe "can identify if it's the last node" do
    it "if node is last returns true" do
      node = Node.new("plop")

      expect(node.last_node?).to eq(true)
    end
  end
end