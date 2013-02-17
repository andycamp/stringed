module Stringed

  module Formatters

    module ASCII
      def self.fret_numbers(string)
        fret_numbers = " "*(string.to_s.length)
        string.frets.each{ |fret| fret_numbers << " "*6 << fret.to_s }
        fret_numbers << "\n"
      end
    end

    class ASCIIString
      include ASCII

      def initialize(string,options)
        @selected_frets = options.fetch(:selected_frets,[])
        @output = "#{string.to_s} |"
        @string = string
        @string.frets.each do |fret|
          if @selected_frets.include?(fret) then
            @output <<  "--x--|"
          else
            @output <<  "-----|"
          end
        end
        @output << "\n"
        @output << fret_numbers if options.has_key? :numbered_frets
      end

      def fret_numbers
        ASCII.fret_numbers(@string)
      end

      def to_s
        @output
      end

    end

  class ASCIIInstrument
    include ASCII

    def initialize(instrument, options={})
      @selected_frets = options.fetch(:selected_frets,[])
      @output = ""
      @instrument = instrument
      @instrument.strings.each do |string|
        @output << string.to(:ascii,options).to_s
      end
      @output << fret_numbers if options.fetch(:numbered_frets,true)
    end

    def fret_numbers
      ASCII.fret_numbers(@instrument.strings[@instrument.strings.map{|i| i.to_s.length}.each_with_index.max[1]])
    end

    def to_s
      @output
    end

  end

  end

end
