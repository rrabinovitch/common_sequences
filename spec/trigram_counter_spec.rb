require 'rspec'
require './lib/trigram_counter'
require './lib/text_processor'

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

    it "returns an empty hash if passed an empty string" do
      empty_text = ""
      expect(TrigramCounter.top_trigrams(empty_text)).to be_empty
    end

    it "returns a hash of fewer than 100 key-value pairs if there are fewer than 100 three-word sequences in the string" do
      normalized_text = "from planning a move to fixing your car to welcoming a newborn overalls is your partner for managing lifes ups and downs from planning a move welcoming a newborn a newborn overalls is is your partner planning a move a move welcoming planning a move planning a move a newborn overalls welcoming a newborn welcoming a newborn"

      expect(TrigramCounter.top_trigrams(normalized_text).count).to eq(41)
    end
  end

  describe "works in conjunction with TextProcessor" do
    it "returns the same top 100 three-word sequences for the same text with and without underscores" do
      raw_txt_file_path = 'spec/fixtures/pride_and_prejudice_ch1-3_fixture.txt'
      no_underscores_txt_file_path = 'spec/fixtures/pride_and_prejudice_ch1-3_no_underscores_fixture.txt'

      raw_txt_processed = TextProcessor.process_text([raw_txt_file_path])
      no_underscores_txt_processed = TextProcessor.process_text([no_underscores_txt_file_path])

      raw_txt_trigrams = TrigramCounter.top_trigrams(raw_txt_processed)
      no_underscores_txt_trigrams = TrigramCounter.top_trigrams(no_underscores_txt_processed)

      expect(raw_txt_trigrams).to eq(no_underscores_txt_trigrams)
    end
  end
end
