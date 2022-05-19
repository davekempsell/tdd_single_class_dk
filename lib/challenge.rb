class GrammarStats
  def initialize
    @texts_checked = 0
    @texts_passed = 0
  end

  def check(text = "")
    punc = [".", "!", "?"]
    fail "ERROR! No text here!" if text == ""
    capital = text[0] == text[0].upcase
    punctuation = punc.include?(text[-1])
    @texts_checked += 1
    if capital && punctuation
      @texts_passed += 1
    end
    return capital && punctuation
  end

  def percentage_good
    fail "No checks made." if @texts_checked == 0
    (@texts_passed / @texts_checked.to_f) * 100
  end
end


# #initialize
# texts_checked
# texts_passed

# #check (text)
# checks first letter is capital
# checks if sentence ends in ?/!/.
# update texts_checked
# update text_passed
# output = boolean

# #percentage_good
# output =  texts checked / texts passed
