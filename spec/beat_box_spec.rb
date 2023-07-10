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
        bb.append("  deep  doo  ditt")
        bb.append("woo hoo shu")
        
        expect(bb.list.head.data).to eq("deep")
        expect(bb.list.head.next_node.data).to eq("doo")
        expect(bb.count).to eq(6)
    end

    it "prepends strings" do
        bb = BeatBox.new
        bb.append("woo hoo shu")
        bb.prepend("deep beep")
        bb.prepend(" deep sleep  keep  ")
        bb.append(" hory  moly  ")

        expect(bb.list.head.data).to eq ("deep")
    end

    it "plays sounds" do
        bb = BeatBox.new
        bb.append("deep doo ditt woo hoo shu")
        bb.play

        expect(bb.count).to eq(6)
        expect(bb.list.count).to eq(6)
    end

    it "adds a text qualifier" do
        bb = BeatBox.new
        bb.append("do mississippi ")
        bb.prepend(" mississippi plop   doo")

        expect(bb.all.include?("mississippi")).to eq(false)
    end
    
    it "changes voice and play speeed" do
        bb = BeatBox.new("deep dop dop deep")
        bb.rate = 100
        p bb.rate
        bb.voice = "Daniel"
        p bb.voice
        bb.play
        bb.reset_rate
        p bb.rate
        bb.reset_voice
        p bb.voice
        bb.play

        expect(bb.list.head.data).to eq("deep")
    end
end