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
    it "downcases and removes punctuation and line endings from input text" do
      text = "   \n From planning a move, to fixing your car, to welcoming a newborn, --Overalls is your partner for managing life’s ups _and_ downs!\n\n"
      normalized_text = "from planning a move to fixing your car to welcoming a newborn overalls is your partner for managing lifes ups and downs"

      expect(TextProcessor.normalize_text(text)).to eq(normalized_text)
    end

    # TODO: consider checking that result of normalizing regular lorem ipsum file produces string that is eq to normalized lorem ipsum file
    # TODO: consider testing that running pride and prejudice w underscores through normalizer method produces a result that is equal to running the file without underscores through the noramlizer method
  end
end
