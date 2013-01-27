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
      Note.note_distance(@root_note.to_s, fret_note.to_s)
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

    def matches(note_name, options={})
      limit = options.has_key? :limit ? options[:limit] : 20
      octave = root_note.octave.to_i
      matches = []
      fret_no = Note.new(note_name+octave)
      while fret_no >= 0 and fret_no <= limit do
        matches << fret_no
        octave.to_i += 1
        fret_no = Note.new(note_name+octave.to_s)
      end
      matches
    end

  end

end
