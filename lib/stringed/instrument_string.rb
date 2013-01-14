module Stringed

  class InstrumentString
    include Music

    attr_reader :root_note

    def initialize(root_note)
      @root_note = Note.new(root_note.to_s)
    end

    def fret_note(fret_no)
      fret_note = @root_note
      fret_no.times{ fret_note = fret_note.next }
      fret_note
    end

    def fret_no(fret_note)
      Note.note_distance(@root_note.to_s, fret_note)
    end

    def self.octave_up(fret_no)
      fret_no + 12
    end

    def self.octave_down(fret_no)
      fret_no - 12
    end

    def to_s
      @root_note.to_s
    end

  end

end
