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
    words = @contents.split(" ")
    words.first(wpm * minutes).join(" ")

    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end

# diary = DiaryEntry.new("Monday", "Example " * 10000)
# p diary.count_words
# p diary.reading_time(100)
