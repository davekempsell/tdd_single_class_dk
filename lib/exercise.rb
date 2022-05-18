class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split(" ").length
  end

  def reading_time(wpm)
    (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    number_of_chunks = (reading_time(wpm) / minutes.to_f).ceil
    counter = 0
    read_words = []
    words = @contents.split(" ")
    
    while counter < number_of_chunks do
      read_words.push(words.first(wpm * minutes))
      words.shift(wpm * minutes)
      counter += 1
      p read_words.last.join(" ")
    end

    return read_words.last(wpm * minutes).join(" ")
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end

# diary = DiaryEntry.new("Monday", "Example " * 10000)
# p diary.count_words
# p diary.reading_time(100)

entry = DiaryEntry.new("Monday", "One two three four five six seven eight nine ten.")
entry.reading_chunk(1, 4)
