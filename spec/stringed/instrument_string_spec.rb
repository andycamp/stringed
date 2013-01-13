require 'spec_helper'

describe InstrumentString do

  let(:e2){ InstrumentString.new('E2')  }

  it { e2.root_note.should eq Note.new('E2') }

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

end
