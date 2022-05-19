class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @furthest = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return words.length
  end

  def reading_time(wpm)
    return (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    chunk_size = wpm * minutes
    start = @furthest
    word_list = words[start, chunk_size]
    if @furthest + chunk_size >= count_words
      @furthest = 0
    else 
      @furthest = @furthest + chunk_size
    end
    return word_list.join(" ")
  end

  private
 
  def words
    return @contents.split(" ")
  end
end