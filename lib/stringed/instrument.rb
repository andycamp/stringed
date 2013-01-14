module Stringed

  class Instrument

    attr_accessor :strings, :neck_length

    def initialize(strings,neck_length)
      @strings = strings.map{ |string| InstrumentString.new(string.to_s)}
      @neck_length = neck_length
    end

    def matches(note)
      strings.map{ |string| in_range?(string.fret_no(note)) ? string.fret_no(note) : nil }
    end

    def in_range?(fret_no)
      fret_no >= 0 and fret_no <= neck_length
    end

  end

end
