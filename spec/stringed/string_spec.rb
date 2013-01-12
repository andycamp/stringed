require 'spec_helper'

describe Stringed::String do

  it "should have base note" do
    Stringed::String.new('E2').root_note.should eq Music::Note.new('E2')
  end

  it "should know what note is at any fret" do
    Stringed::String.new('C2').fret(4).should eq Music::Note.new('E2')
    Stringed::String.new('C2').fret(5).should eq Music::Note.new('F2' )
  end

end
