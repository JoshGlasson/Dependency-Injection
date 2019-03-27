require 'exercise1'

describe Note do
  describe '#display' do
    it 'displays a formatted note' do
      formatter_double = double :noteformatter
      note = Note.new("Test Title", "Test Body", formatter_double)
      allow(formatter_double).to receive(:format).and_return("Title: #{note.title}\n#{note.body}")
      expect(note.display).to eq "Title: Test Title\nTest Body"
    end
  end
end

describe NoteFormatter do
  describe '#format' do
    it 'formats notes' do
      note_double = double :note
      allow(note_double).to receive(:title).and_return("Test Title")
      allow(note_double).to receive(:body).and_return("Test Body")
      expect(subject.format(note_double)).to eq "Title: Test Title\nTest Body"
    end
  end
end
