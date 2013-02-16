module Stringed
  module Formatters
    class ASCIIString
      def initialize(string,options)
        @output = "#{string.to_s} |" << "-----|" * string.fret_count << "\n"
      end
      def to_s
        @output
      end
    end
  end
end
