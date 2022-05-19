require 'challenge'

RSpec.describe GrammarStats do
  it "#check method fails if text is empty" do
    gs = GrammarStats.new
    expect {gs.check("")}.to raise_error "ERROR! No text here!"
  end

  describe "#percentage_good method" do
    it "returns percentage of tests passed" do
      gs = GrammarStats.new
      gs.check("This is some text.")
      gs.check("this is also some text.")
      expect(gs.percentage_good).to eq 50
    end

    it "fails if method is run before check method" do
      gs = GrammarStats.new
      expect {gs.percentage_good}.to raise_error "No checks made."
    end
  end
end