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

end
