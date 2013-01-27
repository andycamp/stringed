require 'spec_helper'

describe Stringed::Instrument do

  let(:guitar) { Stringed::Instrument.new(%w( E2 A2 D3 A3 B3 E4 ), 20) }

  it "should have strings" do
    guitar.strings.count.should == 6
  end

  it "should have a neck length" do
    guitar.neck_length.should == 20
  end

  it "should know where all the matches for a given note are" do
    guitar.matches('F4').should eq [nil, 20, 15, [8,20], [6,18], [1,13]]
    guitar.matches('D3').should eq [10, [5,17], [0,12], nil, nil, nil]
  end

  it "should know where all the matches for a given chord are" do
    guitar.chord_matches(Chord.new(['C4', 'E4', 'G4'])).should eq [8, 3, nil, nil, nil,nil]
  end

end
