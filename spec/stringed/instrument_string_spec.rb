require 'spec_helper'

describe InstrumentString do

  let(:e2){ InstrumentString.new('E2', :fret_count => 20)  }

  it "should have a root note" do
    e2.root_note.should eq Note.new('E2')
  end

  it "should have a fret_count" do
    e2.fret_count.should eq 20
  end

  it "should know the note at any fret" do
    e2.fret_note(4).should eq Note.new('G#2')
  end

  it "should know the fret no of a given note" do
    e2.fret_no('D#3').should eq 11
  end

  it "should know an octave up from a given fret" do
    InstrumentString.octave_up(2).should == 14
  end

  it "should know an octave down from a given fret" do
    InstrumentString.octave_down(14).should == 2
  end

  it "should know to_s" do
    e2.to_s.should eq "E2"
  end

  it "should be able to find a note" do
    e2.find("F").should eq [1,13]
  end

  it "should be able to find a chord" do
    e2.find_chord(Chord.new(["D3","F#3","A3"])).should eq [2,5,10,14,17]
  end

end
