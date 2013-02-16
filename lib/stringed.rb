require "music"
require "stringed/version"
require "stringed/instrument"
require "stringed/instrument_string"
require "stringed/ascii_formatter"

module Stringed

  class Music::Note
    def name
      self.to_s.delete(self.octave.to_s)
    end
  end

end
