module Stringed

  class Instrument

    attr_accessor :strings, :neck_length

    def initialize(strings,neck_length)
      @strings = strings.map{ |string| InstrumentString.new(string.to_s)}
      @neck_length = neck_length
    end

    def matches(note)
      strings.map do |string|
        while in_range?(string.fret_no) do
        string_matches
          if in_range?(string.fret_no(note)) then
            string.fret_no(note)
          else
            nil
          end
        end
      end
    end

    def chord_matches(chord)
      matches = strings.map do |string|
        chord.notes.map do |note|
          if in_range?(string.fret_no(note)) then
            string.fret_no(note)
          else
            nil
          end
        end
      end
      matches.map{|match| match.compact}
    end

    def in_range?(fret_no)
      fret_no >= 0 and fret_no <= neck_length
    end

  end

end
