module Stringed

  class String
    include Music

    attr_reader :root_note

    def initialize(root_note)
      @root_note = Note.new(root_note)
    end

    def fret(number)
      fret_note = @root_note
      number.times{ fret_note = fret_note.next }
      fret_note
    end

  end

end
