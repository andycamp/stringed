require 'spec_helper'

describe Stringed::Instrument do

  let(:guitar) { Stringed::Instrument.new(%w( E2 A2 D3 G3 B3 E4 ), fret_count: 20) }

  it "has strings" do
    guitar.strings.count.should == 6
  end

  it "has a fret count" do
    guitar.fret_count.should == 20
  end

  it "knows where all the matches for a given note are" do
    guitar.find('F').should eq [[1,13], [8,20], [3,15], [10], [6,18], [1,13]]
    guitar.find('D').should eq [[10], [5, 17], [0, 12], [7, 19], [3, 15], [10]]
  end

  it "knows where all the matches for a given chord are" do
    guitar.find_chord(Chord.new(['C4', 'E4', 'G4'])).should eq [[0, 3, 8, 12, 15, 20],
                                                                   [3, 7, 10, 15, 19],
                                                                   [2, 5, 10, 14, 17],
                                                                   [0, 5, 9, 12, 17],
                                                                   [1, 5, 8, 13, 17, 20],
                                                                   [0, 3, 8, 12, 15, 20]]
  end

  describe "formatting"
    context "ascii" do
      let(:nano) { Stringed::Instrument.new(%w( C4 G4 ), fret_count: 6)}
      it "can print an ascii fretboard" do
        nano.to(:ascii).to_s.should eq <<-ASCII
C4 |#{"-----|" * 6}
G4 |#{"-----|" * 6}
        1      2      3      4      5      6
        ASCII
      end
    end

end
