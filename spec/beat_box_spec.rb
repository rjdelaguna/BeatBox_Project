require "./lib/beat_box"
require "./lib/linked_list"
require './lib/node'

RSpec.describe BeatBox do
    it "exists" do 
        bb = BeatBox.new

        expect(bb).to be_an_instance_of(BeatBox)
        expect(bb.list).to be_an_instance_of(LinkedList)
        expect(bb.list.head).to eq(nil)
    end

    it "appends strings into individual nodes" do
        bb = BeatBox.new
        bb.append("deep do ditt")
        
        expect(bb.list.head.data).to eq("deep")
        expect(bb.list.head.next_node.data).to eq("doo")
    end

end
