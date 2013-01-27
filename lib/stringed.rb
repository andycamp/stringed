require "music"
require "stringed/version"
require "stringed/instrument"
require "stringed/instrument_string"

module Stringed
  # Your code goes here...

  class Note
    def name
      self.to_s.delete(self.octave)
    end
  end

end
