module Stringed

  class InstrumentString
    include Music

    attr_reader :root_note, :fret_count

    def initialize(root_note, options={})
      @root_note = Music::Note.new(root_note.to_s)
      @fret_count = options.fetch(:fret_count,14)
    end

    def fret_note(fret_no)
      fret_note = @root_note
      fret_no.times{ fret_note = fret_note.next }
      fret_note
    end

    def fret_no(fret_note)
      Music::Note.note_distance(@root_note.to_s, fret_note.to_s)
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

    def find(note_name)
      matches = []
      (0..(fret_count)).each do |fret|
        matches.push fret if fret_note(fret).name == note_name
      end
      matches
    end

    def find_chord(chord)
      matches = []
      chord.notes.each do |note|
        matches << find(note.name)
      end
      matches.flatten.compact.sort
    end

  end
end
