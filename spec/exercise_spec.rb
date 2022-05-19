require "exercise"

RSpec.describe DiaryEntry do
  it "returns the title as a string." do
    entry = DiaryEntry.new("Monday", "Example." * 100)
    expect(entry.title).to eq "Monday"
  end

  it "returns the contents as a string." do
    entry = DiaryEntry.new("Monday", "Example.")
    expect(entry.contents).to eq "Example."
  end

  it "Returns the number of words in the contents as an integer." do
    entry = DiaryEntry.new("Monday", "Example.")
    expect(entry.count_words).to eq 1
  end

  it "Returns an integer representing an estimate of the reading time in 
    minutes." do
    entry = DiaryEntry.new("Monday", "Example. " * 10000)
    result = entry.reading_time(100)
    expect(result).to eq 100
  end
 
    # `wpm` is an integer representing the number
    # of words the user can read per minute
    # `minutes` is an integer representing the
    # number of minutes the user has to read

    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.

  describe "#reading_chunk" do
    context "with a contents unreadable within the time" do
      it "Returns a readable chunk." do
        entry = DiaryEntry.new("Monday", "Example. Another word to go here.")
        result = entry.reading_chunk(1, 5)
        expect(result).to eq "Example. Another word to go"
      end

      it "when called again, returns the next chunk, skipping what's been read" do
        entry = DiaryEntry.new("Monday", "One two three four five six seven eight nine ten.")
        first_result = entry.reading_chunk(1, 4)
        second_result = entry.reading_chunk(1, 4)
        expect(second_result).to eq "five six seven eight"
      end

      it "restarts from the beginning when contents has been fully read" do
        entry = DiaryEntry.new("Monday", "One two three four five six seven eight nine ten.")
        entry.reading_chunk(4, 2)
        entry.reading_chunk(4, 2)
        result = entry.reading_chunk(4, 2)
        expect(result).to eq "One two three four five six seven eight"
      end
    end
  end  
end
