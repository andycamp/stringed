require 'spec_helper'

describe Stringed::Instrument do

  it "should have strings" do
    Stringed::Instrument.new(:strings => [Music::Note.new('E2'), Music::Note.new('A2')]).strings.count.should == 2
  end

end
