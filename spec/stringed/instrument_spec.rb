require 'spec_helper'

describe Stringed::Instrument do

  let(:guitar) { Stringed::Instrument.new(%w( E2 A2 D3 G3 B3 E4 ), 20) }

  it "should have strings" do
    guitar.strings.count.should == 6
  end

  it "should have a neck length" do
    guitar.neck_length.should == 20
  end

  it "should know where all the matches for a given note are" do
    guitar.matches('F').should eq [[1,13], [8,20], [3,15], [10], [6,18], [1,13]]
    guitar.matches('D').should eq [[10], [5, 17], [0, 12], [7, 19], [3, 15], [10]]
  end

  it "should know where all the matches for a given chord are" do
    guitar.chord_matches(Chord.new(['C4', 'E4', 'G4'])).should eq [[0, 3, 8, 12, 15, 20],
                                                                   [3, 7, 10, 15, 19],
                                                                   [2, 5, 10, 14, 17],
                                                                   [0, 5, 9, 12, 17],
                                                                   [1, 5, 8, 13, 17, 20],
                                                                   [0, 3, 8, 12, 15, 20]]
  end

end
