require 'rspec'
require './lib/text_processor'

RSpec.describe TextProcessor do
  describe "::process_text" do
    it "reads and normalizes the contents of a single txt file" do
      txt_file = './spec/fixtures/lorem_ipsum_fixture.txt'
      result = TextProcessor.process_text([txt_file])

      expect(result).to be_a(String)
      expect(result).to eq(result.downcase)
    end

    it "reads and normalizes the contents of more than one txt file" do
      txt_file1 = 'spec/fixtures/pride_and_prejudice_ch1-3_fixture.txt'
      txt_file2 = 'spec/fixtures/pride_and_prejudice_ch4-6_fixture.txt'

      txt_file1_result = TextProcessor.process_text([txt_file1])
      txt_file2_result = TextProcessor.process_text([txt_file2])
      combined_result = TextProcessor.process_text([txt_file1, txt_file2])

      expect(combined_result).to eq(txt_file1_result.concat(" ", txt_file2_result))
      expect(combined_result).to eq(combined_result.downcase)
    end
  end

  describe "::read_files" do
    it "can read a single txt file" do
      txt_file = './spec/fixtures/lorem_ipsum_fixture.txt'
      result = TextProcessor.read_files([txt_file])
      expect(result).to be_a(String)
    end

    it "can read more than one txt file" do
      txt_file1 = 'spec/fixtures/pride_and_prejudice_ch1-3_fixture.txt'
      txt_file2 = 'spec/fixtures/pride_and_prejudice_ch4-6_fixture.txt'

      txt_file1_result = TextProcessor.read_files([txt_file1])
      txt_file2_result = TextProcessor.read_files([txt_file2])
      combined_result = TextProcessor.read_files([txt_file1, txt_file2])

      expect(combined_result).to be_a(String)
      expect(combined_result.length).to eq(txt_file1_result.length + txt_file2_result.length)
    end

    it "returns an empty string if passed a non-txt file" do
      csv_file = './fake_csv_file.csv'

      result = TextProcessor.read_files([csv_file])
      expect(result).to eq("")
    end
  end

  describe "::normalize_text" do
    it "downcases and removes punctuation, line endings, and underscores from input text" do
      text = "   \n From planning a move, to fixing your car, to welcoming a newborn, --Overalls is your partner for managing life???s ups _and_ downs!\n\n"
      normalized_text = "from planning a move to fixing your car to welcoming a newborn overalls is your partner for managing lifes ups and downs"

      expect(TextProcessor.normalize_text(text)).to eq(normalized_text)
    end

    it "results match the contents of a pre-normalized file of the same text" do
      normalized_lorem_ipsum_text = File.read('./spec/fixtures/normalized_lorem_ipsum_fixture.txt').chomp # removing automatic end-of-file newline
      raw_lorem_ipsum_text = File.read('spec/fixtures/normalized_lorem_ipsum_fixture.txt')

      raw_lorem_ipsum_results = TextProcessor.normalize_text(raw_lorem_ipsum_text)
      expect(raw_lorem_ipsum_results).to eq(normalized_lorem_ipsum_text)
    end
  end
end
