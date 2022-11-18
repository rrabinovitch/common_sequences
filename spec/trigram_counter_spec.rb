# NEXT STEPS:
### how to update testing now that normalization has been moved into a different class
### decide whether to keep file reading in test blocks
### add testing for multiple files

require 'rspec'
require './lib/trigram_counter'

RSpec.describe TrigramCounter do
  describe "::top_trigrams" do
    it "returns 100 most common three-word sequences in a string" do
      normalized_text = File.read('./spec/fixtures/normalized_lorem_ipsum_fixture.txt').chomp # removing automatic end-of-file newline

      top_3_sequences = {
        "dolor sit amet"=>5,
        "sit amet consectetur"=>5,
        "ipsum dolor sit"=>5
      }

      top_100_sequences = TrigramCounter.top_trigrams(normalized_text)

      expect(top_100_sequences.count).to eq(100)
      expect(top_100_sequences.first(3).to_h).to eq(top_3_sequences)
    end
  end
end
