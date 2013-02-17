module Stringed
  module Formatters
    class ASCIIString

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
        @output << fret_numbers << "\n" if options.has_key? :numbered_frets
      end

      def fret_numbers
        fret_numbers = " "*(@string.to_s.length)
        @string.frets.each{ |fret| fret_numbers << " "*6 << fret.to_s }
        fret_numbers
      end

      def to_s
        @output
      end

    end
  end
end
