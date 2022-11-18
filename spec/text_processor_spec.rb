# TODO: make string quote types consistent

require 'rspec'
require './lib/text_processor'

RSpec.describe TextProcessor do
  describe "::process_text" do
    it "text" do
      txt_file = './spec/fixtures/lorem_ipsum_fixture.txt'
      result = TextProcessor.process_text([txt_file])

      expect(result.class).to eq(String)
      expect(result).to eq(result.downcase)
    end
  end

  # TODO: consider additional testing
  describe "::read_files" do
    it "can read a single txt file" do
      txt_file = './spec/fixtures/lorem_ipsum_fixture.txt'
      result = TextProcessor.read_files([txt_file])
      # TODO: look up class verification rspec method - update across all test blocks
      expect(result.class).to eq(String)
      # TODO: expect(result.length).to eq()
    end

    it "can read more than one txt file" do
      txt_file1 = 'spec/fixtures/pride_and_prejudice_ch1-3_fixture.txt'
      txt_file2 = 'spec/fixtures/pride_and_prejudice_ch4-6_fixture.txt'

      txt_file1_result = TextProcessor.read_files([txt_file1])
      txt_file2_result = TextProcessor.read_files([txt_file2])
      combined_result = TextProcessor.read_files([txt_file1, txt_file2])

      expect(combined_result.class).to eq(String)
      expect(combined_result.length).to eq(txt_file1_result.length + txt_file2_result.length)
    end

    it "returns an error if passed a non-txt file" do
      # TODO: fill in
    end
  end

  describe "::normalize_text" do
    it "downcases and removes punctuation and line endings from input text" do
      text = "   \n From planning a move, to fixing your car, to welcoming a newborn, --Overalls is your partner for managing life’s ups _and_ downs!\n\n"
      normalized_text = "from planning a move to fixing your car to welcoming a newborn overalls is your partner for managing lifes ups and downs"

      expect(TextProcessor.normalize_text(text)).to eq(normalized_text)
    end

    # TODO: consider checking that result of normalizing regular lorem ipsum file produces string that is eq to normalized lorem ipsum file
  end
end
