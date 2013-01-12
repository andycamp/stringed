module Stringed

  class Instrument

    attr_accessor :strings

    def initialize(attributes)
      @strings = attributes[:strings] if attributes.has_key? :strings
    end

  end

end
