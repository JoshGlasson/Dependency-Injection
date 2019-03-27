require 'exercise2'

describe Diary do
 describe '#adds and indexes notes' do
   it 'can add title and body' do
     entry_double = double :entry, title: "Title"
     entry_class_double = double :entry_class, new: entry_double
     diary = Diary.new(entry_class_double)
     diary.add("Title", "Body")
     expect(diary.index).to eq "Title"
   end
 end
end

describe Entry do
  describe '#initializes' do
    it 'can create title and body' do
      entry = Entry.new("Title", "Body")
      expect(entry.title).to eq "Title"
    end
  end
end
