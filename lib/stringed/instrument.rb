module Stringed

  class Instrument

    attr_accessor :strings, :fret_count

    def initialize(strings,options={})
      @strings = strings.map{ |string| InstrumentString.new(string.to_s, options)}
      @fret_count = options.fetch(:fret_count,14)
    end

    def find(note)
      matches = []
      strings.each do |string|
        matches << string.find(note)
      end
      matches
    end

    def find_chord(chord)
      matches = []
      strings.each do |string|
        matches << string.find_chord(chord)
      end
      matches
    end

    def in_range?(fret_no)
      fret_no >= 0 and fret_no <= fret_count
    end

    def to(format,options={})
      require "stringed/formatters"
      if format == :ascii then
        Formatters::ASCIIInstrument.new(self,options)
      end
    end

  end

end
