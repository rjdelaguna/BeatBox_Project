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

  it "uses separate method to deal with multiple words in string" do
    bb = BeatBox.new
    bb.append("woo hoo shu")
    bb.prepend("deep beep")
    bb.separate("deep mighty beep")
    
    expect(bb.all).to eq("deep beep woo hoo shu deep beep")
  end

  it "plays sounds" do
    bb = BeatBox.new
    bb.append("deep doo ditt woo hoo shu")
    # bb.play

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
    bb.voice = "Daniel"
    # bb.play
    bb.reset_rate
    bb.reset_voice
    # bb.play

    expect(bb.list.head.data).to eq("deep")
  end

  it "uses initial? method to store data from start of class" do
    bb = BeatBox.new("deep dop dop deep")
    bb1 = BeatBox.new
    bb1.initial?("deep dop dop deep")

    expect(bb.all).to eq("deep dop dop deep")
    expect(bb1.all).to eq("deep dop dop deep")
  end
end