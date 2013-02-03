module Stringed

  class Instrument

    attr_accessor :strings, :neck_length

    def initialize(strings,neck_length)
      @strings = strings.map{ |string| InstrumentString.new(string.to_s)}
      @neck_length = neck_length
    end

    def matches(note)
      matches = []
      strings.each do |string|
        matches << string.matches(note, {limit: @neck_length})
      end
      matches
    end

    def chord_matches(chord)
      matches = []
      strings.each do |string|
        string_matches = []
        chord.notes.each do |note|
          string_matches << string.matches(note.name,{ limit: @neck_length })
        end
        matches << string_matches.flatten.compact.sort
      end
      matches
    end

    def in_range?(fret_no)
      fret_no >= 0 and fret_no <= neck_length
    end

  end

end
