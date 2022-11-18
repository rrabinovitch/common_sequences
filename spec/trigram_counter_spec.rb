require 'rspec'
require './lib/trigram_counter'

RSpec.describe TrigramCounter do
  describe  "::normalize_text" do
    xit "downcases and removes punctuation and line endings from input text" do
      text = "   \n From planning a move, to fixing your car, to welcoming a newborn, --Overalls is your partner for managing life’s ups _and_ downs!\n\n"
      normalized_text = "from planning a move to fixing your car to welcoming a newborn overalls is your partner for managing lifes ups and downs"

      expect(TrigramCounter.normalize_text(text)).to eq(normalized_text)
    end
  end

  describe "::top_trigrams" do
    it "returns 100 most common three-word sequences in a single .txt file that does not have any punctuation or newlines to be considered" do
      text = File.read('./spec/fixtures/normalized_lorem_ipsum_fixture.txt')

      top_3_sequences = {
        "dolor sit amet"=>5,
        "sit amet consectetur"=>5,
        "ipsum dolor sit"=>5
      }

      top_100_sequences = TrigramCounter.top_trigrams(text)

      expect(top_100_sequences.count).to eq(100)
      expect(top_100_sequences.first(3).to_h).to eq(top_3_sequences)
    end

    it "returns the same most common three-word sequences in a single .txt file that _does_ have punctuation, newlines, and mixed capitalization" do
      text = File.read('./spec/fixtures/lorem_ipsum_fixture.txt')

      top_3_sequences = {
        "dolor sit amet"=>5,
        "sit amet consectetur"=>5,
        "ipsum dolor sit"=>5
      }

      top_100_sequences = TrigramCounter.top_trigrams(text)

      expect(top_100_sequences.count).to eq(100)
      expect(top_100_sequences.first(3).to_h).to eq(top_3_sequences)
      # additional testing to consider: confirm that results are appearing in same order across normalized vs denormalized files
    end
  end
end
