require 'spec_helper'

describe InstrumentString do

  let(:e2){ InstrumentString.new('E2')  }

  context "InstrumentString#new" do
    it { e2.root_note.should eq Note.new('E2') }
    it { InstrumentString.new(Note.new('A2')).root_note.to_s.should eq 'A2' }
  end

  it "should know what note is at any fret" do
    e2.fret_note(4).should eq Note.new('G#2')
    e2.fret_note(5).should eq Note.new('A2' )
  end

  it "should know what fret to use for a pitch" do
    e2.fret_no('G2').should eq 3
    e2.fret_no('D#3').should eq 11
  end

  it "should know how the fret_no an octave up from any given fret_no" do
    InstrumentString.octave_up(0).should == 12
  end

  it "should know how the fret_no an octave down from any given fret_no" do
    InstrumentString.octave_down(12).should == 0
  end

  it { e2.to_s.should eq "E2" }

  it "should know the matches for a note name" do
    e2.matches("F", :limit => 20).should eq [2,14]
    e2.matches("F", :limit => 30).should eq [2,14,26]
  end

end
